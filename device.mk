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

# Graphics
PRODUCT_VENDOR_PROPERTIES += \
    ro.gfx.driver.1=com.qualcomm.qti.gpudrivers.taro.api31

# Kernel
KERNEL_PREBUILT_DIR := $(LOCAL_PATH)-kernel

# Overlays
PRODUCT_PACKAGES += \
    UnicornSettingsProviderOverlay \
    UnicornWifiOverlay \
    UnicornFrameworksOverlay \
    UnicornNfcOverlay \
    UnicornApertureOverlay \

# NFC
TARGET_NFC_SKU := unicorn

# Powershare
PRODUCT_PACKAGES += \
    vendor.aospa.powershare-service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.unicorn.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.unicorn.rc

# System Props
PRODUCT_VENDOR_PROPERTIES += \
    ro.surface_flinger.set_idle_timer_ms?=1000 \
    ro.surface_flinger.set_touch_timer_ms?=200 \
    ro.vendor.audio.us.proximity=true \
    ro.vendor.audio.us.proximity_waitfornegative_feature=true \
    vendor.audio.ultrasound.stoplatency=60 \
    vendor.audio.ultrasound.usync=1000 \
    ro.vendor.sensors.notifier.light_sensors=5,33171089 \
    ro.vendor.sensors.xiaomi.single_tap=true \
    ro.vendor.sensors.xiaomi.udfps=true \
    persist.nfc.camera.pause_polling=true \
    ro.miui.notch=1 \
    ro.product.mod_device=unicorn

# Sensors
PRODUCT_PACKAGES += \
    sensors.xiaomi

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)