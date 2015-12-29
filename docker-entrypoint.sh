#!/bin/bash

# Configure Postgres, SOLR and Gisgraphy
/usr/local/bin/configure-postgres.sh
/usr/local/bin/configure-solr.sh
/usr/local/bin/configure-gisgraphy.sh

exec "$@";
