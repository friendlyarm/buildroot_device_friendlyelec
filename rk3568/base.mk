#!/bin/bash

TARGET_PLAT=rk3568
TARGET_ARCH=arm64
CROSS_COMPILER=aarch64-linux-gnu-
TARGET_OSNAME=buildroot

# buildroot
# 

TARGET_BUILDROOT_CONFIG=rockchip_rk3568_defconfig
BUILDROOT_SRC=buildroot
BUILDROOT_FILES+=(device/rockchip)
BUILDROOT_FILES+=(device/friendlyelec/misc-files)
BUILDROOT_FILES+=(device/friendlyelec/keep-the-net-classic-naming)
BUILDROOT_FILES+=(device/friendlyelec/network-interfaces)
BUILDROOT_FILES+=(device/friendlyelec/fancontrol)
BUILDROOT_FILES+=(device/friendlyelec/rom-version)
BUILDROOT_FILES+=(device/friendlyelec/disable-unnecessary-services)
BUILDROOT_FILES+=(device/friendlyelec/rk3568/disable-unnecessary-services)
BUILDROOT_FILES+=(device/friendlyelec/load-modules-service)
BUILDROOT_FILES+=(device/friendlyelec/rk3568/r8125)
BUILDROOT_FILES+=(device/friendlyelec/firmware)
BUILDROOT_FILES+=(device/friendlyelec/alsa-config)
BUILDROOT_FILES+=(device/friendlyelec/usbdevice-wrapper)

# U-boot
# 

TARGET_UBOOT_CONFIG=nanopi5_defconfig

# Kernel
# 

TARGET_KERNEL_CONFIG=nanopi5_linux_defconfig
TARGET_KERNEL_DTB=resource.img

# Misc
# 
TARGET_IMAGE_DIRNAME=buildroot
BUILDROOT_OUTDIR=output/rockchip_rk3568
TARGET_SD_RAW_FILENAME=buildroot_$(date +%Y%m%d)_rk3568_arm64_sd.img
TARGET_EFLASHER_RAW_FILENAME=buildroot_$(date +%Y%m%d)_rk3568_arm64_eflasher.img


