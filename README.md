> :warning: **This is not an official VisualWebArena repo. For the official instructions refer to [VisualWebArena](https://github.com/web-arena-x/visualwebarena/tree/main/environment_docker)**

# visualwebarena-setup

Setup scripts for visualwebarena.

## Configure

Edit `00_vars.sh` with your ports and hostname (or ip address).

Download the necessary docker images from the [official visualwebarena repo](https://github.com/web-arena-x/visualwebarena/tree/main/environment_docker). You'll need the following files:
- classifieds_docker_compose.zip
- shopping_final_0712.tar
- postmill-populated-exposed-withimg.tar
- wikipedia_en_all_maxi_2022-05.zim

Unzip the classifieds docker folder:
```sh
unzip classifieds_docker_compose.zip
```

Create a wiki folder and move the wikipedia file to it
```sh
mkdir wiki
mv wikipedia_en_all_maxi_2022-05.zim wiki/
```

## Run

Easiest way is to start a tmux or screen session, then run scripts 01 to 06 in order. The last script serves the homepage and should stay up.
```bash
sudo bash 01_docker_load_images.sh
sudo bash 02_docker_remove_containers.sh
sudo bash 03_docker_create_containers.sh
sudo bash 04_docker_start_containers.sh
sudo bash 05_docker_patch_containers.sh
sudo bash 06_serve_homepage.sh
```

## Safety check

Go to the homepage and click each link to make sure the websites are operational (some might take ~10 secs to load the first time).

## Reset

After an agent is evaluated on WebArena, a reset is required before another agent can be evaluated.

Run scripts 02 to 06 again.
