#!/bin/bash

source 00_vars.sh

assert() {
  if ! "$@"; then
    echo "Assertion failed: $@" >&2
    exit 1
  fi
}

# make sure all required files are here
assert [ -f ${ARCHIVES_LOCATION}/shopping_final_0712.tar ]
assert [ -f ${ARCHIVES_LOCATION}/shopping_admin_final_0719.tar ]
assert [ -f ${ARCHIVES_LOCATION}/postmill-populated-exposed-withimg.tar ]
assert [ -f ${ARCHIVES_LOCATION}/gitlab-populated-final-port8023.tar ]
assert [ -f ${ARCHIVES_LOCATION}/openstreetmap-website-db.tar.gz ]
assert [ -f ${ARCHIVES_LOCATION}/openstreetmap-website-web.tar.gz ]
assert [ -f ${ARCHIVES_LOCATION}/openstreetmap-website.tar.gz ]
assert [ -f ${ARCHIVES_LOCATION}/wikipedia_en_all_maxi_2022-05.zim ]

# load docker images
docker load --input ${ARCHIVES_LOCATION}/shopping_final_0712.tar
docker load --input ${ARCHIVES_LOCATION}/shopping_admin_final_0719.tar
docker load --input ${ARCHIVES_LOCATION}/postmill-populated-exposed-withimg.tar
docker load --input ${ARCHIVES_LOCATION}/gitlab-populated-final-port8023.tar
docker load --input ${ARCHIVES_LOCATION}/openstreetmap-website-db.tar.gz
docker load --input ${ARCHIVES_LOCATION}/openstreetmap-website-web.tar.gz

# extract openstreetmap archive locally
if [ ! -d ./openstreetmap-website ]
  tar -xzf ${ARCHIVES_LOCATION}/openstreetmap-website.tar.gz
fi

# copy wikipedia archive to local folder
WIKIPEDIA_ARCHIVE=wikipedia_en_all_maxi_2022-05.zim
if [ ! -f ./wiki/${WIKIPEDIA_ARCHIVE} ]; then
  mkdir -p ./wiki
  cp ${ARCHIVES_LOCATION}/${WIKIPEDIA_ARCHIVE} ./wiki
fi
