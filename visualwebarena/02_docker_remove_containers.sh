#!/bin/bash

# stop if any error occur
set -e

docker stop classifieds_db classifieds forum shopping wikipedia
docker remove classifieds_db classifieds forum shopping wikipedia

