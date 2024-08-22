#
# Copyright (C) 2024 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8450-common
$(call inherit-product, device/xiaomi/sm8450-common/common.mk)

# Get specific aspects
$(call inherit-product, vendor/xiaomi/unicorn/unicorn-vendor.mk)

# Inherit Firmware
$(call inherit-product-if-exists, vendor/xiaomi/firmware/unicorn/config.mk)

# Init scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.touch_report.rc:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/etc/init/init.touch_report.rc \
    $(LOCAL_PATH)/rootdir/etc/init.touch_report.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.touch_report.rc

# Overlays
PRODUCT_PACKAGES += \
    UnicornSettingsProviderOverlay \
    UnicornWifiOverlay \
    UnicornFrameworksOverlay \
    UnicornNfcOverlay \
    UnicornApertureOverlay \

# Powershare
PRODUCT_PACKAGES += \
    vendor.aospa.powershare-service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.unicorn.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.unicorn.rc
    
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.sensors.notifier.light_sensors=5,33171089 \
    ro.vendor.sensors.xiaomi.single_tap=true \
    ro.vendor.sensors.xiaomi.udfps=true
    
# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)