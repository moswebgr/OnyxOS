# OnyxOS product for Xiaomi Redmi Note 8 Pro (begonia)

$(call inherit-product, device/redmi/begonia/lineage_begonia.mk)

PRODUCT_NAME := onyx_begonia
PRODUCT_DEVICE := begonia
PRODUCT_BRAND := OnyxOS
PRODUCT_MODEL := Redmi Note 8 Pro
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE :=

PRODUCT_SYSTEM_NAME := OnyxOS
PRODUCT_SYSTEM_PROPERTIES += \
    ro.onyx.device=begonia \
    ro.onyx.base=android14
