$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/mediatek/mt6592/mt6592-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/mediatek/mt6592/overlay

LOCAL_PATH := device/mediatek/mt6592
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_PACKAGES += \
    libxlog

PRODUCT_PACKAGES += \
    lights.mt6592

PRODUCT_PACKAGES += \
    libmtkrilw

PRODUCT_PACKAGES += \
    audio.r_submix.default

PRODUCT_PACKAGES += \
    audio.primary.mt6592

PRODUCT_PACKAGES += \
    audio_policy.default

PRODUCT_PACKAGES += \
    lib_driver_cmd_mt66xx

PRODUCT_PACKAGES += \
    libbt-vendor

PRODUCT_COPY_FILES += \
    device/mediatek/mt6592/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl \
    device/mediatek/mt6592/mtk-tpd.kl:system/usr/keylayout/mtk-tpd.kl

PRODUCT_COPY_FILES += \
    device/mediatek/mt6592/init.recovery.mt6592.rc:root/init.recovery.mt6592.rc

PRODUCT_COPY_FILES += \
    device/mediatek/mt6592/audio/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_COPY_FILES += \
    device/mediatek/mt6592/fstab.mt6592:root/fstab.mt6592 \
    device/mediatek/mt6592/init.mt6592.rc:root/init.mt6592.rc \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml

PRODUCT_COPY_FILES += \
    device/mediatek/mt6592/media_codecs.xml:system/etc/media_codecs.xml \
    device/mediatek/mt6592/media_profiles.xml:system/etc/media_profile.xml

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_mt6592
PRODUCT_DEVICE := mt6592

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
