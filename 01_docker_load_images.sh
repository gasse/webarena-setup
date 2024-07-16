#!/bin/bash

# download the archives from the visualwebarena instructions
# https://github.com/web-arena-x/visualwebarena/tree/main/environment_docker

# shopping_final_0712.tar
# postmill-populated-exposed-withimg.tar

docker load --input shopping_final_0712.tar
docker load --input postmill-populated-exposed-withimg.tar

