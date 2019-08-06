FROM percona:latest as build
USER root

ENV PASSWORD secret
ENV USDANL http://github.com/nmaster/usdanl-sr28-mysql.git

# Install temp files
WORKDIR /tmp
COPY \
    fix-utf8.sh fix_db_names.pl sr28_import.patch init-usda-db.sql \
    fndds-data.sql init-dri-db.sql dri-data.sql \
    /tmp/

# Install build utilities
RUN yum updateinfo && yum install -y \
    dos2unix \
    git \
    less \
    patch \
    unzip \
    wget \
    && yum clean all

# Install the USDA and DRI databases
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
    (MYSQL_ROOT_PASSWORD=$PASSWORD runuser -pu mysql /docker-entrypoint.sh mysqld 2>/dev/null & ) ; \
    sleep 60; \
#   Wait up to two minutes for server to start
    for n in {59..0}; do \
        sleep 2; \
        if echo 'SELECT 1' | mysql -u root --password=$PASSWORD &> /dev/null; then \
            break; \
        fi; \
    done; \
#   If it didn't start, abort
    if ["$n" = 0]; then \
        /bin/false; \
    fi; \
#   Now run the install script
    sh ./sr28_import.sh root $PASSWORD; \
#   Export the newly-created database as a SQL script. Convert table
#   and field names to lowercase in the process.
    cp ../init-usda-db.sql ../usda.sql; \
    mysqldump -u root --password=$PASSWORD usda \
        | perl ../fix_db_names.pl >> ../usda.sql; \
#   Recreate the DB and dump it to get a clean install script
    mysql -u root --password=$PASSWORD < ../usda.sql; \
    cp ../init-usda-db.sql ../usda.sql; \
    mysqldump -u root --password=$PASSWORD usda >> ../usda.sql; \
#   Import the dietary reference intake data and sync it with the
#   USDA data; then dump the result. (dri-data.sql isn't just a
#   backup. It also does some SQL script stuff to linke the DBs.)
    cat ../init-dri-db.sql ../dri-data.sql \
        | mysql -u root --password=$PASSWORD; \
    cat ../init-dri-db.sql > ../dri-data.sql; \
    mysqldump -u root --password=$PASSWORD dietary_reference_intake >> ../dri-data.sql;

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
COPY --from=build /tmp/usda.sql /tmp/dri-data.sql /tmp/fndds-data.sql /docker-entrypoint-initdb.d/

# By default, start MySQL server when container is started
EXPOSE 3306
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["mysqld"]

