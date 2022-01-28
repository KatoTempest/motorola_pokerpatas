#
# Copyright (C) 2021 The Android Open Source Project
# Copyright (C) 2021 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/pokerp

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Build
BUILD_BROKEN_DUP_RULES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

# Assert
TARGET_OTA_ASSERT_DEVICE := pokerp, pokerp_64

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

# Partitions size
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432 # This is the maximum known partition size, but it can be higher, so we just omit it
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3011510272
BOARD_CACHEIMAGE_PARTITION_SIZE := 629145600
BOARD_VENDORIMAGE_PARTITION_SIZE := 738197504
BOARD_USERDATAIMAGE_PARTITION_SIZE := 3221225472

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_BOOTIMG_HEADER_VERSION := 1
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x11a88000
BOARD_KERNEL_TAGS_OFFSET := 0x07808000
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
#TARGET_KERNEL_SOURCE := kernel/motorola/pokerp
#TARGET_KERNEL_CONFIG := p161bn_defconfig

# System as root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_SUPPRESS_SECURE_ERASE := true

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USE_FRAMEBUFFER_ALPHA_CHANNEL := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_DISABLE_TRIPLE_BUFFERING := false
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/etc/recovery.fstab

# Platform
TARGET_BOARD_PLATFORM := mt6765
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true
PLATFORM_SDK_VERSION := 28

# TWRP Configuration
TW_DEVICE_VERSION := 3
TW_DEFAULT_DEVICE_NAME := pokerp_64
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_USE_TOOLBOX := true
TW_Y_OFFSET := 54
TW_H_OFFSET := -54
TW_NO_SCREEN_BLANK := true
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true
TARGET_USES_MKE2FS := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_SKIP_COMPATIBILITY_CHECK := true
TW_NO_BATT_PERCENT := false
TW_EXCLUDE_TWRPAPP := true
TW_EXCLUDE_SUPERSU := true
TW_INCLUDE_REPACKTOOLS := true
#TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true
TW_OVERRIDE_SYSTEM_PROPS += "ro.build.fingerprint"
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_DEFAULT_BRIGHTNESS := 115
TW_MAX_BRIGHTNESS := 255
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Decryption
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
#TW_CRYPTO_USE_SYSTEM_VOLD := true
#PLATFORM_SECURITY_PATCH := 2021-08-01
#VENDOR_SECURITY_PATCH := 2019-10-01
#PLATFORM_VERSION := 9.0.0

TARGET_RECOVERY_DEVICE_MODULES += \
    android.hidl.base@1.0 \
    libpuresoftkeymasterdevice

TW_RECOVERY_ADDITIONAL_RELINK_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.base@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so

# Debugging
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true

PLATFORM_VERSION := 20.1.0
PLATFORM_SECURITY_PATCH := 2099-12-311
VENDOR_SECURITY_PATCH := 2099-12-31

# AVB - Android Verified Boot / dm-verity
BOARD_AVB_ENABLE := true
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
