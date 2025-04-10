#!/bin/bash

TARGET_PLAT=rk3528
TARGET_ARCH=arm64
CROSS_COMPILER=aarch64-linux-gnu-
TARGET_OSNAME=buildroot

# buildroot
# 

TARGET_BUILDROOT_CONFIG=rockchip_rk3528_defconfig
BUILDROOT_SRC=buildroot
BUILDROOT_FILES+=(device/rockchip)
BUILDROOT_FILES+=(device/friendlyelec/misc-files)
BUILDROOT_FILES+=(device/friendlyelec/keep-the-net-classic-naming)
BUILDROOT_FILES+=(device/friendlyelec/network-interfaces)
BUILDROOT_FILES+=(device/friendlyelec/network-leds)
BUILDROOT_FILES+=(device/friendlyelec/fancontrol)
BUILDROOT_FILES+=(device/friendlyelec/rom-version)
BUILDROOT_FILES+=(device/friendlyelec/rk3528/disable-unnecessary-services)
BUILDROOT_FILES+=(device/friendlyelec/load-modules-service)
BUILDROOT_FILES+=(device/friendlyelec/rk3528/r8125)
BUILDROOT_FILES+=(device/friendlyelec/alsa-config)
BUILDROOT_FILES+=(device/friendlyelec/usbdevice-wrapper)

# U-boot
# 

TARGET_UBOOT_CONFIG=nanopi_zero2_defconfig

# Kernel
# 

TARGET_KERNEL_CONFIG="nanopi5_linux_defconfig kvm.config"
TARGET_KERNEL_DTB=resource.img

# Misc
# 
TARGET_IMAGE_DIRNAME=buildroot
BUILDROOT_OUTDIR=output/rockchip_rk3528
TARGET_SD_RAW_FILENAME=buildroot_$(date +%Y%m%d)_rk3528_arm64_sd.img
TARGET_EFLASHER_RAW_FILENAME=buildroot_$(date +%Y%m%d)_rk3528_arm64_eflasher.img


