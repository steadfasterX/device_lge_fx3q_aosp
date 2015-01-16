## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# vendor blobs
$(call inherit-product-if-exists, device/lge/fx3q/fx3q-vendor-blobs.mk)

# Release name
PRODUCT_RELEASE_NAME := fx3q

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/lge/fx3q/device_fx3q.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := fx3q
PRODUCT_NAME := cm_fx3q
PRODUCT_BRAND := lge
PRODUCT_MODEL := fx3q
PRODUCT_MANUFACTURER := lge
