FROM percona:latest as build
LABEL maintainer="Len Budney (len.budney@gmail.com)"

# Download the database
WORKDIR /tmp
COPY fix-utf8.sh sr28_import.patch init-db.sql /tmp/

# Install unzip
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
    git clone http://github.com/nmaster/usdanl-sr28-mysql.git; \
    cd usdanl-sr28-mysql; \
#   Fix the import script to perform some data cleanup before loading
    patch -p0 < ../sr28_import.patch; \
#   Perform two additional fixes to the script
    sed -i -e 's}LOAD DATA INFILE}LOAD DATA LOCAL INFILE}' sr28_import.sh; \
    sed -i -e 's}usdanlsr28}usda}g' sr28_import.sh sr28_schema.sql; \
#   Start MySQL server
    (MYSQL_ROOT_PASSWORD=secret /docker-entrypoint.sh mysqld 2>/dev/null & ) ; \
#   Wait up to two minutes for server to start
    for n in `seq 1 60`; do \
        sleep 2; \
        if service mysql status | egrep -q "is running"; then \
            break; \
        fi; \
    done; \
#   If it didn't start, abort
    if ! service mysql status | egrep -q "is running"; then \
        /bin/false; \
    fi; \
#   Now run the install script
    sh ./sr28_import.sh root secret; \
#   Export the newly-created database as a SQL script
    cp ../init-db.sql ../usda.sql; \
    mysqldump -u root --password=secret usda >> ../usda.sql;

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

