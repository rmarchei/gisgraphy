#!/bin/bash

POSTGRES_RESOLVED_HOST=${POSTGRES_EXT_HOST:-${POSTGRES_PORT_5432_TCP_ADDR:-"UNAVAILABLE"}}
POSTGRES_RESOLVED_PORT=${POSTGRES_EXT_PORT:-${POSTGRES_PORT_5432_TCP_PORT:-"5432"}}

sed -i "/jdbc.url=/c\jdbc.url=jdbc:postgresql://${POSTGRES_RESOLVED_HOST}:${POSTGRES_RESOLVED_PORT}/gisgraphy" \
    /opt/gisgraphy/webapps/ROOT/WEB-INF/classes/jdbc.properties
sed -i "/hibernate.connection.url=/c\hibernate.connection.url=jdbc:postgresql://${POSTGRES_RESOLVED_HOST}:${POSTGRES_RESOLVED_PORT}/gisgraphy" \
    /opt/gisgraphy/webapps/ROOT/WEB-INF/classes/jdbc.properties


PGUSERNAME=${PGUSERNAME:-${POSTGRES_ENV_POSTGRES_USER:-"postgres"}}

sed -i "/jdbc.username=/c\jdbc.username=${PGUSERNAME}" \
    /opt/gisgraphy/webapps/ROOT/WEB-INF/classes/jdbc.properties
sed -i "/hibernate.connection.username=/c\hibernate.connection.username=${PGUSERNAME}" \
    /opt/gisgraphy/webapps/ROOT/WEB-INF/classes/jdbc.properties


PGPASSWORD=${PGPASSWORD:-${POSTGRES_ENV_POSTGRES_PASSWORD:-"postgres"}}

sed -i "/jdbc.password=/c\jdbc.password=${PGPASSWORD}" \
    /opt/gisgraphy/webapps/ROOT/WEB-INF/classes/jdbc.properties
sed -i "/hibernate.connection.password=/c\hibernate.connection.password=${PGPASSWORD}" \
    /opt/gisgraphy/webapps/ROOT/WEB-INF/classes/jdbc.properties
