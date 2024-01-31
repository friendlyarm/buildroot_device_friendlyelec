#!/bin/bash
set -eu
ROOTFS_DIR=$1
CURRPATH=$PWD

(cd ${ROOTFS_DIR} && {
	cp -af $CURRPATH/files/* ./
	[ -f ./etc/init.d/S50usbdevice ] && mv ./etc/init.d/S50usbdevice ./etc/init.d/K50usbdevice
	rm -f ./lib/udev/rules.d/61-usbdevice.rules 
})
