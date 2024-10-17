#!/bin/bash

source 00_vars.sh

docker load --input ${ARCHIVES_LOCATION}/shopping_final_0712.tar
docker load --input ${ARCHIVES_LOCATION}/postmill-populated-exposed-withimg.tar
