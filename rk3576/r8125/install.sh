#!/bin/bash
set -eu
ROOTFS_DIR=$1

(cd ${ROOTFS_DIR} && {
	if [ ! -d etc/sysconfig ]; then
		mkdir -p etc/sysconfig
		touch etc/sysconfig/modules
		echo "warning: not found etc/sysconfig, please check"
	fi
	[ -f etc/sysconfig/modules ] && sed -i -e '/r8169/d' etc/sysconfig/modules
	echo 'r8125' >> etc/sysconfig/modules
})
