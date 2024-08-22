#
# Copyright (C) 2024 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8450-common
$(call inherit-product, device/xiaomi/sm8450-common/common.mk)

# Get specific aspects
$(call inherit-product, vendor/xiaomi/unicorn/unicorn-vendor.mk)

# Overlays
PRODUCT_PACKAGES += \
    UnicornSettingsProviderOverlay \
    UnicornWifiOverlay \
    UnicornFrameworksOverlay \
    UnicornNfcOverlay

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)