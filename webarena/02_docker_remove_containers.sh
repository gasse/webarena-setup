#!/bin/bash

# stop if any error occur
set -e

docker stop shopping_admin forum gitlab shopping wikipedia openstreetmap-website-db-1 openstreetmap-website-web-1
docker remove shopping_admin forum gitlab shopping wikipedia openstreetmap-website-db-1 openstreetmap-website-web-1

