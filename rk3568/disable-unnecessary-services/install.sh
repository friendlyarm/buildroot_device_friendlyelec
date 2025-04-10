#!/bin/bash
set -eu
ROOTFS_DIR=$1

services+=("40rkaiq_3A")
services+=("98iodomain.sh")

(cd ${ROOTFS_DIR} && {
    cd etc/init.d
    for (( i=0; i<${#services[@]}; i++ ));
    do
        if [ -f S${services[$i]} ]; then
            mv S${services[$i]} K${services[$i]}
        else
            true
        fi
    done
})
