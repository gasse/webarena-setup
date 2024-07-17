#!/bin/bash

docker start shopping
docker start forum
docker start wikipedia

cd classifieds_docker_compose/
docker compose start

echo -n -e "Waiting 60 seconds for all services to start..."
sleep 60
echo -n -e " done\n"

