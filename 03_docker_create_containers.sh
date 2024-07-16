#!/bin/bash

source 00_vars.sh

WORKING_DIR=$(pwd)

docker create --name shopping -p $SHOPPING_PORT:80 shopping_final_0712
docker create --name shopping_admin -p $SHOPPING_ADMIN_PORT:80 shopping_admin_final_0719
docker create --name forum -p $REDDIT_PORT:80 postmill-populated-exposed-withimg
docker create --name gitlab -p $GITLAB_PORT:$GITLAB_PORT gitlab-populated-final-port8023 /opt/gitlab/embedded/bin/runsvdir-start --env GITLAB_PORT=$GITLAB_PORT
docker create --name wikipedia --volume=${WORKING_DIR}/wiki/:/data -p $WIKIPEDIA_PORT:80 ghcr.io/kiwix/kiwix-serve:3.3.0 wikipedia_en_all_maxi_2022-05.zim

cd openstreetmap-website/
cp ../openstreetmap_docker-compose.yml.template docker-compose.yml
sed -i "s|MAP_PORT|${MAP_PORT}|g" docker-compose.yml
docker compose create

