> :warning: **This is not an official WebArena repo. For the official instructions refer to [WebArena](https://github.com/web-arena-x/webarena/tree/main/environment_docker)**

# webarena-setup

Setup scripts for webarena.

## Configure

Edit `00_vars.sh` with your ports and hostname (or ip address).

Download the necessary docker images from the [official webarena repo](https://github.com/web-arena-x/webarena/tree/main/environment_docker). You'll need the following files:
- shopping_final_0712.tar
- shopping_admin_final_0719.tar
- postmill-populated-exposed-withimg.tar
- gitlab-populated-final-port8023.tar
- wikipedia_en_all_maxi_2022-05.zim

Download the additional openstreetmap docker files from Zenodo:
```sh
wget https://zenodo.org/records/12636845/files/openstreetmap-website-db.tar.gz
wget https://zenodo.org/records/12636845/files/openstreetmap-website-web.tar.gz
wget https://zenodo.org/records/12636845/files/openstreetmap-website.tar.gz
```

Untar the openstreemap docker folder:
```sh
tar -xzf openstreetmap-website.tar.gz
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
