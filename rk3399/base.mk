#!/bin/bash

TARGET_PLAT=rk3399
TARGET_ARCH=arm64
CROSS_COMPILER=aarch64-linux-gnu-
TARGET_OSNAME=buildroot

# buildroot
# 

TARGET_BUILDROOT_CONFIG=friendlyelec_rk3399_defconfig
BUILDROOT_SRC=buildroot
BUILDROOT_FILES+=(device/friendlyelec/overwrite-rk-files)
BUILDROOT_FILES+=(device/friendlyelec/keep-the-net-classic-naming)
BUILDROOT_FILES+=(device/friendlyelec/network-interfaces)
BUILDROOT_FILES+=(device/friendlyelec/fancontrol)
BUILDROOT_FILES+=(device/friendlyelec/rom-version)
BUILDROOT_FILES+=(device/friendlyelec/disable-unnecessary-services)
BUILDROOT_FILES+=(device/friendlyelec/load-modules-service)
BUILDROOT_FILES+=(device/friendlyelec/rk3399/r8169)
BUILDROOT_FILES+=(device/friendlyelec/rk3399/wifi_module)

# U-boot
# 

TARGET_UBOOT_CONFIG=rk3399_defconfig

# Kernel
# 

TARGET_KERNEL_CONFIG=nanopi4_linux_defconfig
TARGET_KERNEL_DTB=resource.img

# Misc
# 
TARGET_IMAGE_DIRNAME=buildroot
TARGET_SD_RAW_FILENAME=Buildroot_$(date +%Y%m%d)_RK3399_arm64_sd.img
TARGET_EFLASHER_RAW_FILENAME=Buildroot_$(date +%Y%m%d)_RK3399_arm64_eflasher.img


