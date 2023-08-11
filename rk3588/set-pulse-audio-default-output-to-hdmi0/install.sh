#!/bin/bash
set -eu
ROOTFS_DIR=$1
CURRPATH=$PWD

(cd $ROOTFS_DIR && {
	if [ -f etc/pulse/default.pa ]; then
		sed -i -e '/set-default-sink /d' etc/pulse/default.pa
		sed -i -e '/set-default-source /d' etc/pulse/default.pa
		echo "set-default-sink alsa_output.platform-hdmi0-sound.stereo-fallback" >> etc/pulse/default.pa
	fi
})

