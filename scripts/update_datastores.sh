#!/bin/bash

# Replace the values in the specified datastore file with elements from the 
# environment

# lockfile so we only run once
SETUP_LOCKFILE="${GEOSERVER_DATA_DIR}/.updatedatastore.lock"
if [ -f "${SETUP_LOCKFILE}" ]; then
	exit 0
fi

DATASTORE_FILE=${DATASTORE_FILE:-/opt/geoserver/data_dir/workspaces/postgis/postgis/datastore.xml}
POSTGIS_HOST=${POSTGIS_HOST:-db}
POSTGIS_USER=${POSTGIS_USER:-docker}
POSTGIS_PASS=${POSTGIS_PASS:-docker}
POSTGIS_DB=${POSTGIS_DB:-geoserver}

cp $DATASTORE_FILE $DATASTORE_FILE.orig

cat $DATASTORE_FILE.orig | \
	sed -e "s/__POSTGIS_HOST__/${POSTGIS_HOST}/" | \
	sed -e "s/__POSTGIS_USER__/${POSTGIS_USER}/" | \
	sed -e "s/__POSTGIS_PASS__/${POSTGIS_PASS}/" | \
	sed -e "s/__POSTGIS_DB__/${POSTGIS_DB}/" > $DATASTORE_FILE

# touch the lockfile so we don't run again
touch ${SETUP_LOCKFILE}


