# Copyright (C) 2015 The CyanogenMod Project
#		2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


# inherit from the proprietary version
-include vendor/lenovo/al732row/BoardConfigVendor.mk

# GPS
TARGET_SPECIFIC_HEADER_PATH := device/lenovo/al732row/include

# Platform
TARGET_BOARD_PLATFORM := mt6735m
TARGET_NO_BOOTLOADER := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a7

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := mt6735m

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

# Kernel
BOARD_KERNEL_CMDLINE += \
	bootopt=64S3,32N2,32N2 \
	androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048

# make_ext4fs requires numbers in dec format
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216 
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216 
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_USERDATAIMAGE_PARTITION_SIZE := 3975675904 
BOARD_CACHEIMAGE_PARTITION_SIZE := 419430400
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x04000000 --tags_offset 0x0e000000 --board 1473313359
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.9/bin
TARGET_KERNEL_SOURCE := kernel/lenovo/al732row
TARGET_KERNEL_CONFIG := lineage_al732row_defconfig

BOARD_CUSTOM_BOOTIMG := true

TARGET_KMODULES := true

# Assert
TARGET_OTA_ASSERT_DEVICE := al732row,A2016b30

#COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# Disable memcpy opt (for audio libraries)
TARGET_CPU_MEMCPY_OPT_DISABLE := true

# EGL
BOARD_EGL_CFG := device/lenovo/al732row/configs/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_REQUIRES_SYNCHRONOUS_SETSURFACE := true

# MTK Hardware
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true

# Offline charging
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/BOOT/BOOT/boot/boot_mode

# RIL 
BOARD_RIL_CLASS := ../../../device/lenovo/al732row/ril/

BOARD_CONNECTIVITY_VENDOR := MediaTek
BOARD_CONNECTIVITY_MODULE := conn_soc

# WIFI
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM:="/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA:=STA
WIFI_DRIVER_FW_PATH_AP:=AP
WIFI_DRIVER_FW_PATH_P2P:=P2P

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lenovo/al732row/bluetooth

# Sensors
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# CWM
TARGET_RECOVERY_FSTAB := device/lenovo/al732row/rootdir/root/recovery.fstab
TARGET_PREBUILT_RECOVERY_KERNEL := device/lenovo/al732row/kernel
BOARD_HAS_NO_SELECT_BUTTON := true

# TWRP stuff
TW_THEME := portrait_hdpi
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_NO_REBOOT_BOOTLOADER := true
TW_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file
TW_MAX_BRIGHTNESS := 255
TW_EXCLUDE_SUPERSU := true
TW_INCLUDE_FB2PNG := true
TW_NO_CPU_TEMP := true
TW_REBOOT_BOOTLOADER := true
TW_REBOOT_RECOVERY := true
TW_HAS_DOWNLOAD_MODE := true
TW_EXCLUDE_SUPERSU := true
TW_USE_TOOLBOX := true

TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun%d/file"

BOARD_SEPOLICY_DIRS := \
       device/lenovo/al732row/sepolicy

# Use old sepolicy version
POLICYVERS := 29

BLOCK_BASED_OTA := false
TARGET_LDPRELOAD += libxlog.so:libmtk_symbols.so # for symbols in mtkaudio.cpp + mtksymbols

