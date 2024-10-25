#!/bin/bash

# stop if any error occur
set -e

source 00_vars.sh

docker load --input ${ARCHIVES_LOCATION}/shopping_final_0712.tar
docker load --input ${ARCHIVES_LOCATION}/shopping_admin_final_0719.tar
docker load --input ${ARCHIVES_LOCATION}/postmill-populated-exposed-withimg.tar
docker load --input ${ARCHIVES_LOCATION}/gitlab-populated-final-port8023.tar
docker load --input ${ARCHIVES_LOCATION}/openstreetmap-website-db.tar.gz
docker load --input ${ARCHIVES_LOCATION}/openstreetmap-website-web.tar.gz

