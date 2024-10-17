#!/bin/bash

# PUBLIC_HOSTNAME=$(curl -s ifconfig.me)
PUBLIC_HOSTNAME="YOUR_HOSTNAME_HERE"

# Change ports as desired
CLASSIFIEDS_PORT=9001
SHOPPING_PORT=3306
REDDIT_PORT=8080
WIKIPEDIA_PORT=42022
HOMEPAGE_PORT=80

CLASSIFIEDS_URL="http://${PUBLIC_HOSTNAME}:${CLASSIFIEDS_PORT}"
SHOPPING_URL="http://${PUBLIC_HOSTNAME}:${SHOPPING_PORT}"
REDDIT_URL="http://${PUBLIC_HOSTNAME}:${REDDIT_PORT}/forums/all"
WIKIPEDIA_URL="http://${PUBLIC_HOSTNAME}:${WIKIPEDIA_PORT}/wikipedia_en_all_maxi_2022-05/A/User:The_other_Kiwix_guy/Landing"

# Download the archive files from the visualwebarena instructions
# https://github.com/web-arena-x/visualwebarena/tree/main/environment_docker
# - shopping_final_0712.tar
# - postmill-populated-exposed-withimg.tar

ARCHIVES_LOCATION="./"
