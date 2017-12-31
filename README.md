Resilio Sync
===============

Sync uses peer-to-peer technology to provide fast, private file sharing for teams and individuals. By skipping the cloud, transfers can be significantly faster because files take the shortest path between devices. Sync does not store your information on servers in the cloud, avoiding cloud privacy concerns.

# Build
```
$ docker build -t sync:slim .
```

# Usage

    WEBUI_PORT=[ port to access the webui on the host ]
    STORAGE_FOLDER=/path/to/settings/
    
    mkdir -p $STORAGE_PATH

    docker run -d --name Sync \
      -p 127.0.0.1:$WEBUI_PORT:8888 -p 55555 \
      -v $STORAGE_FOLDER:/mnt/config \
      --restart on-failure \
      sync:slim

Go to localhost:$WEBUI_PORT in a web browser to access the webui.

#### LAN access

If you do not want to limit the access to the webui to localhost, run instead:

    docker run -d --name Sync \
      -p $WEBUI_PORT:8888 -p 55555 \
      -v $DATA_FOLDER:/home/user/folders \
      -v $STORAGE_FOLDER:/mnt/config \
      --restart on-failure \
      sync:slim

#### Extra directories

If you need to mount extra directories, mount them in /mnt/mounted_folders:

    docker run -d --name Sync \
      -p 127.0.0.1:$WEBUI_PORT:8888 -p 55555 \
      -v $STORAGE_PATH:/mnt/config \
      -v <OTHER_DIR>:/mnt/mounted_folders/<DIR_NAME> \
      -v <OTHER_DIR2>:/mnt/mounted_folders/<DIR_NAME2> \
      --restart on-failure \
      sync:slim

Do not create directories at the root of mounted_folders from the Sync webui since this new folder will not be mounted on the host.

# Ports

* 8888 - Webui
* 55555 - Listening port for Sync traffic
