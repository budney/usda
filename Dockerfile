FROM percona:latest as build
ENV PASSWORD secret
ENV USDANL http://github.com/nmaster/usdanl-sr28-mysql.git

# Install temp files
WORKDIR /tmp
COPY fix-utf8.sh sr28_import.patch init-db.sql /tmp/

# Install build utilities
RUN apt-get update && apt-get install -y --no-install-recommends \
    dos2unix \
    git \
    less \
    patch \
    unzip \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Install the USDA database
RUN set -ex; \
#   Download the script that automates creation of the USDA database
    git clone $USDANL; \
    cd usdanl-sr28-mysql; \
#   Fix the import script to perform some data cleanup before loading
    patch -p0 < ../sr28_import.patch; \
#   Perform two additional fixes to the script
    sed -i -e 's}LOAD DATA INFILE}LOAD DATA LOCAL INFILE}' sr28_import.sh; \
    sed -i -e 's}usdanlsr28}usda}g' sr28_import.sh sr28_schema.sql; \
#   Start MySQL server
    (MYSQL_ROOT_PASSWORD=$PASSWORD /docker-entrypoint.sh mysqld 2>/dev/null & ) ; \
    sleep 30; \
#   Wait up to two minutes for server to start
    for n in `seq 1 120`; do \
        sleep 1; \
        if service mysql status | egrep -q "is running"; then \
            break; \
        fi; \
    done; \
#   If it didn't start, abort
    if ! service mysql status | egrep -q "is running"; then \
        /bin/false; \
    fi; \
#   Now run the install script
    sh ./sr28_import.sh root $PASSWORD; \
#   Export the newly-created database as a SQL script. Convert table
#   and field names to lowercase in the process.
    cp ../init-db.sql ../usda.sql; \
    mysqldump -u root --password=$PASSWORD usda \
        | tr A-Z a-z >> ../usda.sql; \
#   Weird hack, but change all the table/field names to lowercase
    mysql -u root --password=$PASSWORD < ../usda.sql; \
    cp ../init-db.sql ../usda.sql; \
    mysqldump -u root --password=$PASSWORD usda >> ../usda.sql;

#
#===============================================================================
#

# This is the Dockerfile for the final target image
FROM percona:latest
LABEL maintainer="Len Budney (len.budney@gmail.com)"
LABEL "net.jeenyus.usda.source"="https://www.ars.usda.gov/northeast-area/beltsville-md-bhnrc/beltsville-human-nutrition-research-center/nutrient-data-laboratory/docs/sr28-download-files/"
LABEL "net.jeenyus.usda.instructions"="https://www.percona.com/doc/percona-server/LATEST/installation/docker.html"
LABEL "net.jeenyus.usda.scripts"="https://github.com/nmaster/usdanl-sr28-mysql"

# Copy the DB setup script
COPY --from=build /tmp/usda.sql /docker-entrypoint-initdb.d/usda.sql

# By default, start MySQL server when container is started
EXPOSE 3306
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["mysqld"]

