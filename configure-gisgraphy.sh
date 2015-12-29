#!/bin/bash

sed --in-place -e 's!tail -f -n600 ./logs/gisgraphy.log!tail -F -n600 ./logs/gisgraphy.log!' \
    /opt/gisgraphy/logs.sh 

sed --in-place -e 's!-Xmx4G!-Xmx8G!' \
    /opt/gisgraphy/start.sh
