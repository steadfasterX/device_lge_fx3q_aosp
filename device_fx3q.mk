# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lge/fx3q/fx3q-vendor.mk)

LOCAL_PATH := device/lge/fx3q
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PREBUILT_SHARED_LIBRARY += \
	vendor/lge/fx3q/proprietary/system/lib/libskia.so:obj/lib/libskia.so \

#	vendor/lge/fx3q/proprietary/system/lib/libgenlock.so:obj/lib/libgenlock.so \
#	vendor/lge/fx3q/proprietary/system/lib/libOmxVdec.so:obj/lib/libOmxVdec.so \
#	vendor/lge/fx3q/proprietary/system/lib/libOmxVenc.so:obj/lib/libOmxVenc.so \
#	vendor/lge/fx3q/proprietary/system/lib/libqdutils.so:obj/lib/libqdutils.so \
#	vendor/lge/fx3q/proprietary/system/lib/libtilerenderer.so:obj/lib/libtilerenderer.so \
#	vendor/lge/fx3q/proprietary/system/lib/libmemalloc.so:obj/lib/libmemalloc.so \
#    	vendor/lge/fx3q/proprietary/system/lib/libstagefright_soft_ddpdec.so:obj/lib/libstagefright_soft_ddpdec.so \
#        vendor/lge/fx3q/proprietary/system/lib/libstagefright_soft_dtsdec.so:obj/lib/:obj/lib/libstagefright_soft_dtsdec.so \
#        vendor/lge/fx3q/proprietary/system/lib/libstagefrighthw.so:obj/lib/libstagefrighthw.so \
#        vendor/lge/fx3q/proprietary/system/lib/libstagefright_enc_common.so:obj/lib/libstagefright_enc_common.so \
#        vendor/lge/fx3q/proprietary/system/lib/libstagefright_soft_mp3dec.so:obj/lib/libstagefright_soft_mp3dec.so \
#        vendor/lge/fx3q/proprietary/system/lib/libstagefright_avc_common.so:obj/lib/libstagefright_avc_common.so \
#        vendor/lge/fx3q/proprietary/system/lib/libstagefright_soft_flacenc.so:obj/lib/libstagefright_soft_flacenc.so \
#        vendor/lge/fx3q/proprietary/system/lib/libstagefright_soft_amrwbenc.so:obj/lib/libstagefright_soft_amrwbenc.so \
#        vendor/lge/fx3q/proprietary/system/lib/libstagefright_soft_rawdec.so:obj/lib/libstagefright_soft_rawdec.so \
#        vendor/lge/fx3q/proprietary/system/lib/libstagefright_soft_g711dec.so:obj/lib/libstagefright_soft_g711dec.so \
#        vendor/lge/fx3q/proprietary/system/lib/libstagefright_amrnb_common.so:obj/lib/libstagefright_amrnb_common.so \
#        vendor/lge/fx3q/proprietary/system/lib/libstagefright_soft_h264dec.so:obj/lib/libstagefright_soft_h264dec.so \
#        vendor/lge/fx3q/proprietary/system/lib/libstagefright_yuv.so:obj/lib/libstagefright_yuv.so \
#        vendor/lge/fx3q/proprietary/system/lib/libstagefright_foundation.so:obj/lib/libstagefright_foundation.so \
#        vendor/lge/fx3q/proprietary/system/lib/libstagefright_soft_mpeg4dec.so:obj/lib/libstagefright_soft_mpeg4dec.so \
#        vendor/lge/fx3q/proprietary/system/lib/libstagefright_soft_vpxdec.so:obj/lib/libstagefright_soft_vpxdec.so \
#        vendor/lge/fx3q/proprietary/system/lib/libstagefright_soft_amrdec.so:obj/lib/libstagefright_soft_amrdec.so \
#        vendor/lge/fx3q/proprietary/system/lib/libstagefright_soft_amrnbenc.so:obj/lib/libstagefright_soft_amrnbenc.so \
#        vendor/lge/fx3q/proprietary/system/lib/libstagefright_soft_aacdec.so:obj/lib/libstagefright_soft_aacdec.so \
#        vendor/lge/fx3q/proprietary/system/lib/libstagefright_omx.so:obj/lib/libstagefright_omx.so \
#        vendor/lge/fx3q/proprietary/system/lib/libstagefright.so:obj/lib/libstagefright.so \
#        vendor/lge/fx3q/proprietary/system/lib/libstagefright_soft_h264enc.so:obj/lib/libstagefright_soft_h264enc.so \
#        vendor/lge/fx3q/proprietary/system/lib/libstagefright_soft_mpeg4enc.so:obj/lib/libstagefright_soft_mpeg4enc.so \
#        vendor/lge/fx3q/proprietary/system/lib/libstagefright_soft_aacenc.so:obj/lib/libstagefright_soft_aacenc.so \
#        vendor/lge/fx3q/proprietary/system/lib/libstagefright_soft_vorbisdec.so:obj/lib/libstagefright_soft_vorbisdec.so
#
##	vendor/lge/fx3q/proprietary/system/lib/liboverlay.so:obj/lib/liboverlay.so \

# Copy proprietary vendor files
PRODUCT_COPY_FILES += \
	vendor/lge/fx3q/proprietary/fstab.qcom:root/fstab.qcom \
	vendor/lge/fx3q/proprietary/system/lib/libandroid_runtime.so:obj/lib/libandroid_runtime.so \

#	vendor/lge/fx3q/scripts/initrd/init.fx3q.rc:root/init.fx3q.rc \
#    	vendor/lge/fx3q/scripts/initrd/init.fx3.rc:root/init.fx3.rc \
#    	vendor/lge/fx3q/scripts/initrd/init.lge.rc:root/init.lge.rc \
#    	vendor/lge/fx3q/scripts/initrd/init.lge.usb.rc:root/init.lge.usb.rc

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=+1

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := fx3q
PRODUCT_NAME := full_fx3q
PRODUCT_BRAND := lge
PRODUCT_MODEL := fx3q
PRODUCT_MANUFACTURER := lge


# TWRP
PRODUCT_COPY_FILES += \
    device/lge/fx3q/twrp.fstab:recovery/root/etc/twrp.fstab 


# Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml


# Device overlay
DEVICE_PACKAGE_OVERLAYS += device/lge/fx3q/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

#PRODUCT_BOOT_JARS += qcmediaplayer

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm8960 \
    memtrack.msm8960 \
    power.msm8960 \
    libmemalloc \
    libqdutils \
    libgenlock \
    liboverlay \
    gralloc.msm8960 \
    hwcomposer.msm8960

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    audio_policy.msm8960 \
    audio.primary.msm8960 \
    libaudio-resampler

# Media
PRODUCT_PACKAGES += \
    libdivxdrmdecrypt \
    libmm-omxcore \
    libOmxCore \
    libc2dcolorconvert \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libstagefrighthw \
    qcmediaplayer \
    libOmxVdecHevc \
    libOmxVdec \
    libOmxVenc \
    libdashplayer


# Camera
PRODUCT_PACKAGES += \
    camera.msm8960

# WiFi
PRODUCT_PACKAGES += \
    libQWiFiSoftApCfg \
    libqsap_sdk

# GPS
PRODUCT_PACKAGES += \
    gps.msm8960 \
    gps.conf \
    sap.conf

# FM radio
#PRODUCT_PACKAGES += \
#    qcom.fmradio \
#    FM2 \
#    FMRecord
#    libqcomfm_jni \

# NFC Support
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := device/lge/fx3q/nfc/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := device/lge/fx3q/nfc/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml



# CRDA
PRODUCT_PACKAGES += \
    crda \
    regdbdump \
    regulatory.bin \
    linville.key.pub.pem

# Torch
PRODUCT_PACKAGES += Torch

# Lights
PRODUCT_PACKAGES += lights.msm8960

#Legacy HW -- needed for tspdrv / vibrator
PRODUCT_PACKAGES += libhardware_legacy

# QRNGD
PRODUCT_PACKAGES += qrngd

# Thermal profiles
PRODUCT_PACKAGES += \
    thermald-8930ab.conf \
    thermald-8930.conf

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

#common build.props
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    persist.radio.add_power_save=1 \
    persist.radio.dont_use_dsd=true \
    persist.radio.apm_sim_not_pwdn=1 \
    ro.ril.transmitpower=true \
    ro.warmboot.capability=1 \
    ro.qualcomm.cabl=0 \
    ro.opengles.version=196608 \
    af.resampler.quality=4 \
    persist.audio.fluence.mode=endfire \
    persist.audio.vr.enable=false \
    persist.audio.handset.mic=digital \
    ro.use_data_netmgrd=true \
    lpa.decode=true \
    lpa.use-stagefright=true \
    rild.libpath=/system/lib/libril-qc-qmi-1.so \
    persist.rild.nitz_plmn="" \
    persist.rild.nitz_long_ons_0="" \
    persist.rild.nitz_long_ons_1="" \
    persist.rild.nitz_long_ons_2="" \
    persist.rild.nitz_long_ons_3="" \
    persist.rild.nitz_short_ons_0="" \
    persist.rild.nitz_short_ons_1="" \
    persist.rild.nitz_short_ons_2="" \
    persist.rild.nitz_short_ons_3="" \
    ril.subscription.types=NV,RUIM \
    persist.gps.qmienabled=true \
    persist.gps.qc_nlp_in_use=0 \
    persist.fuse_sdcard=true \
    ro.vold.umsdirtyratio=50 \
    ro.cwm.enable_key_repeat=true \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0 \
    mm.enable.smoothstreaming=true \
    persist.timed.enable=true

PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    debug.egl.hw=1 \
    persist.hwc.mdpcomp.enable=true \
    debug.mdpcomp.logs=0 \
    ro.telephony.ril_class=SamsungQualcommRIL \
    ro.telephony.call_ring.multiple=0

# For userdebug builds
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0 \
    persist.service.adb.enable=1 \
    persist.service.debuggable=1

# For Quick Remote
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.lge.eula_agreement=true

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
