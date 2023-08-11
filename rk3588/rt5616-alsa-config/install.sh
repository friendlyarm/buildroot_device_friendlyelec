#!/bin/bash
set -eu
ROOTFS_DIR=$1
CURRPATH=$PWD

(cd $ROOTFS_DIR && {
	mkdir -p usr/share/alsa/init
	cp -af $CURRPATH/files/usr/share/alsa/init/rt5616 usr/share/alsa/init/

	# install one line before LABEL="init_end"
	if ! grep -q "CARDINFO{driver}==\"realtek_rt5616-\"" usr/share/alsa/init/00main; then
		sed -i '/^LABEL="init_end"/i ''CARDINFO{driver}=="realtek_rt5616-", INCLUDE="rt5616", GOTO="init_end"'"\n" usr/share/alsa/init/00main
	fi

	# clear old alsa state
	rm -f var/lib/alsa/asound.state	
})

