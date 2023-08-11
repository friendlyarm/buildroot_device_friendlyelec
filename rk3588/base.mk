#!/bin/bash

TARGET_PLAT=rk3588
TARGET_ARCH=arm64
CROSS_COMPILER=aarch64-linux-gnu-
TARGET_OSNAME=buildroot

# buildroot
# 

TARGET_BUILDROOT_CONFIG=rockchip_rk3588_defconfig
BUILDROOT_SRC=buildroot
BUILDROOT_FILES+=(device/rockchip)
BUILDROOT_FILES+=(device/friendlyelec/overwrite-rk-files)
BUILDROOT_FILES+=(device/friendlyelec/keep-the-net-classic-naming)
BUILDROOT_FILES+=(device/friendlyelec/network-interfaces)
BUILDROOT_FILES+=(device/friendlyelec/fancontrol)
BUILDROOT_FILES+=(device/friendlyelec/rom-version)
BUILDROOT_FILES+=(device/friendlyelec/disable-unnecessary-services)
BUILDROOT_FILES+=(device/friendlyelec/rk3588/disable-unnecessary-services)
BUILDROOT_FILES+=(device/friendlyelec/load-modules-service)
BUILDROOT_FILES+=(device/friendlyelec/rk3588/r8125)
BUILDROOT_FILES+=(device/friendlyelec/rk3588/rt5616-alsa-config)
BUILDROOT_FILES+=(device/friendlyelec/rk3588/set-pulse-audio-default-output-to-hdmi0)
BUILDROOT_FILES+=(device/friendlyelec/firmware)

# U-boot
# 

TARGET_UBOOT_CONFIG=nanopi6_defconfig

# Kernel
# 

TARGET_KERNEL_CONFIG=nanopi6_linux_defconfig
TARGET_KERNEL_DTB=resource.img

# Misc
# 
TARGET_IMAGE_DIRNAME=buildroot
BUILDROOT_OUTDIR=output/rockchip_rk3588
TARGET_SD_RAW_FILENAME=buildroot_$(date +%Y%m%d)_RK3588_arm64_sd.img
TARGET_EFLASHER_RAW_FILENAME=buildroot_$(date +%Y%m%d)_RK3588_arm64_eflasher.img


