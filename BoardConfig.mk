#
# Copyright (C) 2024 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/unicorn

# Bootloader
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/configs/board/board-info.txt

# Partitions
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9122611200 # (BOARD_SUPER_PARTITION_SIZE - 4MB overhead)

# Powershare
TARGET_POWERSHARE_NODE := /sys/class/qcom-battery/reverse_chg_mode

# Sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Inherit from sm8450-common
include device/xiaomi/sm8450-common/BoardConfigCommon.mk

# Display
TARGET_SCREEN_DENSITY := 560

# OTA
TARGET_OTA_ASSERT_DEVICE := unicorn|2206122SC

# Include proprietary files
include vendor/xiaomi/unicorn/BoardConfigVendor.mk