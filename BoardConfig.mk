USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/lge/fx3q/BoardConfigVendor.mk

BOARD_VENDOR := LGE
TARGET_BOARD_PLATFORM := msm8960
TARGET_CPU_VARIANT := krait
TARGET_CPU_SMP := true
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_BSP
TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_BOOTLOADER_BOARD_NAME := fx3q

BOARD_KERNEL_CMDLINE := androidboot.hardware=fx3q user_debug=31 vmalloc=308M androidboot.selinux=permissive lge_handle_panic.hreset_enable=0 lge.signed_image=false zcache
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048

# Kernel build options either prebuilt:
TARGET_PREBUILT_KERNEL := device/lge/fx3q/kernel
# AOSP does NOT support integrated kernel building like CM!
#TARGET_PRODUCT=fx3q_tmo_us
#TARGET_KERNEL_SOURCE := kernel/lge/fx3q
#TARGET_KERNEL_CONFIG := fx3q_tmo_us_defconfig
#TARGET_KERNEL_MODULES := setup_fs
## Use GCC 4.6 to compile the kernel as recommended by LG:
#ARM_EABI_TOOLCHAIN :=$(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin

#TARGET_NO_INITLOGO := true

## build flags
#LOCAL_C_INCLUDES += \
#	$(TOP)/hardware/qcom/display/libqdutils	
#include $(BUILD_SHARED_LIBRARY) 

#HAVE_SELINUX := false

# Partition sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 12582912
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 12582912
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1291845632
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1384120320
BOARD_CACHEIMAGE_PARTITION_SIZE := 838860800
BOARD_FLASH_BLOCK_SIZE := 131072

# TWRP
DEVICE_RESOLUTION := 480x800
TARGET_USERIMAGES_USE_F2FS := false

# Recovery
#ENABLE_LOKI_RECOVERY := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_USES_MMCUTILS := true
TARGET_RECOVERY_FSTAB := device/lge/fx3q/recovery.fstab
#TARGET_RECOVERY_INITRC := device/lge/fx3q/recovery/root/init.recovery.rc
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/lcd/panel/backlight\"

# Graphics
#TARGET_QCOM_DISPLAY_VARIANT := caf
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
BOARD_HAVE_OLD_ION_API := true
BOARD_EGL_CFG := device/lge/fx3q/proprietary/lib/egl/egl.cfg

# Audio
#TARGET_QCOM_AUDIO_VARIANT := caf
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_LEGACY_ALSA_AUDIO := true
TARGET_USES_QCOM_COMPRESSED_AUDIO := true
# According to http://rootzwiki.com/topic/38114-stevespear-pub-aokp-builds-project-unicorn-butter/page-86#entry1104604
# if no audio that may fix it:
#BOARD_HAVE_LOW_LATENCY_AUDIO := true


# Media
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
#TARGET_QCOM_MEDIA_VARIANT := caf
TARGET_DISPLAY_USE_RETIRE_FENCE := false

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_PROVIDES_CAMERA_HAL := true
TARGET_PROVIDES_LIBCAMERA := true
COMMON_GLOBAL_CFLAGS += -DLGF6_CAMERA_HARDWARE

# Wifi related defines
WIFI_BAND := 802_11_ABG
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE := bcmdhd
WIFI_DRIVER_FW_PATH_STA := "/system/etc/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P := "/system/etc/firmware/fw_bcmdhd_p2p.bin"
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"

# BLUETOOTH 
BOARD_HAVE_BLUETOOTH := false
#BOARD_HAVE_BLUETOOTH_BCM := true
#BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/fx3q/bluetooth
#BOARD_BLUEDROID_VENDOR_CONF := device/lge/fx3q/bluetooth/libbt_vndcfg.txt
##BT_ALT_STACK := true

# GPS
BOARD_HAVE_NEW_QC_GPS := true

# FM
QCOM_FM_ENABLED := true
BOARD_USES_SEPERATED_FM := true

# NFC
BOARD_HAVE_NFC := true
#BOARD_NFC_HAL_SUFFIX := default

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# PowerHAL
#TARGET_USES_CM_POWERHAL := true

# Build our own PowerHAL
TARGET_POWERHAL_VARIANT :=

# Charger
#BOARD_CHARGING_MODE_BOOTING_LPM := \"/sys/class/power_supply/battery/capacity\"
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
BOARD_BATTERY_DEVICE_NAME := "battery"
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_RES := device/lge/fx3q/ramdisk/res/images/charger

# Vold
BOARD_VOLD_MAX_PARTITIONS := 24
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Workaround to avoid issues with legacy liblights on QCOM platforms
TARGET_PROVIDES_LIBLIGHT := true

# Releasetools
#TARGET_PROVIDES_RELEASETOOLS := true
#TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/lge/f6mt/releasetools/ota_from_target_files

# Assert
TARGET_OTA_ASSERT_DEVICE := LGMD520,fx3q,f3q

# Vibrator
BOARD_HAS_VIBRATOR_IMPLEMENTATION := ../../device/lge/fx3q/vibrator/tspdrv.c

# Create Odex Files
#WITH_DEXPREOPT := true
#PRODUCT_BOOT_JARS := $(subst $(space),:,$(PRODUCT_BOOT_JARS))

# MultiROM - This NEED a kexec patched kernel!
MR_INPUT_TYPE := type_b
# find /sys | grep uevent | grep *the_thingIwantToInit*
MR_INIT_DEVICES := device/lge/fx3q/mr_init_devices.c
#MR_RD_ADDR := 0x82200000
MR_DPI := hdpi
#MR_DPI_MUL := 0.375
MR_DPI_MUL := 0.3
MR_FSTAB := device/lge/fx3q/mr.fstab
MR_KEXEC_MEM_MIN := 0x83000000
#MR_INFOS := device/lge/d520/mrom_infos

# Rest
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_NO_SELECT_BUTTON := true

