# docker-geoserver

A simple docker container that runs geoserver forked from
git://github.com/kartoza/docker-geoserver to add support for injecting
configuration into a datastore.xml file living in the data directory
in order to facilitate automated deployments of PostGIS connected
geoserver clusters.

Please refer to KARTOZA-README.md for the original readme file.

## build process

1. check out the confiured geoserver data directory to
`resources/overlays/opt/geoserver/data_dir`.
1. `docker build . -t ps-geoserver:latest`

## environment variables

refer to the enviornment variables in the KARTOZA-README.md file for the
base set.  This fork adds support for 4 additional variables:

`POSTGIS_HOST` - the hostname of the PostGIS instance
`POSTGIS_USER` - the username of the PostGIS instance
`POSTGIS_PASS` - the password of the PostGIS instance user
`POSTGIS_DB` - the database on the PostGIS instance
