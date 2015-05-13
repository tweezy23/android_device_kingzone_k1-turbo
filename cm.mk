## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := K1_turbo

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/kingzone/k1-turbo/device_k1-turbo.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := k1-turbo
PRODUCT_NAME := cm_k1-turbo
PRODUCT_BRAND := KINGZONE
PRODUCT_MODEL := K1_turbo
PRODUCT_MANUFACTURER := KINGZONE
