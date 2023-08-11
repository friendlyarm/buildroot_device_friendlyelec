#!/bin/bash
set -eu
ROOTFS_DIR=$1
CURRPATH=$PWD

(cd $ROOTFS_DIR && {
	# apply etc/firmware
	[ -L etc/firmware ] && rm -f etc/firmware
	cp -af $CURRPATH/files/etc/* etc/

	# apply system/etc system/vendor
	[ -d system ] || mkdir system
	cp -af $CURRPATH/files/system/* system/

	# apply /usr/lib/firmware or /lib/firmware
	if [ -d lib -a -d lib/firmware ]; then
		echo "case 0"
		cp -af $CURRPATH/files/usr/lib/* lib/
	else
		if [ -d usr/lib/firmware ]; then
			echo "case 1"
			cp -af $CURRPATH/files/usr/lib/* $ROOTFS_DIR/usr/lib/
			if [ ! -e lib/firmware ]; then
				[ -d lib ] || mkdir lib
				ln -s /usr/lib/firmware lib/firmware
			fi
		elif [ -L lib/firmware ]; then
			echo "case 2"
			cp -af $CURRPATH/files/usr/lib/* $ROOTFS_DIR/$(readlink lib/firmware)/
		elif [ -d lib/firmware ]; then
			echo "case 3"
			cp -af $CURRPATH/files/usr/lib/* lib/
		else
			echo "case 4"
			cp -af $CURRPATH/files/usr/lib/* $ROOTFS_DIR/usr/lib/
		fi
	fi
})
