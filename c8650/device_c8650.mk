$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_cn_supl.mk)

# proprietary side of the device
$(call inherit-product-if-exists, vendor/huawei/c8650/c8650-vendor.mk)

# removed by george,2011-11-24, my birthday
ifeq (1,0)
$(call inherit-product, build/target/product/full.mk)
else
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

PRODUCT_BRAND := Huawei

endif

DEVICE_PACKAGE_OVERLAYS += device/huawei/c8650/overlay

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := huawei_c8650
PRODUCT_DEVICE := c8650
PRODUCT_MODEL := huawei_c8650
#PRODUCT_LOCALES := zh_CN zh_TW en_US
PRODUCT_LOCALES := zh_CN en_US zh_TW

#add Galery3D by shenqi 1214
#added by ioz9 for Stk 2012.03.15
PRODUCT_PACKAGES += \
    librs_jni \
    libOmxCore \
    libOmxVidEnc \
    dexpreopt \
    gps.c8650 \
    load_wifi \
    LeWaFM \
    Stk

# removed by ioz9 for fix led long alert,but we lost purple and pink
#    lights.c8650 \

#liuhao removed, use PicFolder.apk
#    Gallery3D \   
#    FM \
#    LiveWallpapers \
#    LiveWallpapersPicker \
#    VisualizationWallpapers \
#    MagicSmokeWallpapers \
#    VisualizationWallpapers \
#    SpareParts \
#    Term \

DISABLE_DEXPREOPT := false

# from gkmade version
ifeq (1,0)
# Keylayouts
PRODUCT_COPY_FILES += \
    device/huawei/c8650/keychars/surf_keypad.kcm.bin:system/usr/keychars/surf_keypad.kcm.bin \
    device/huawei/c8650/keychars/surf_keypad.kcm.bin:system/usr/keychars/synaptics.kcm.bin \
    device/huawei/c8650/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    device/huawei/c8650/keylayout/surf_keypad.kl:system/usr/keylayout/surf_keypad.kl
else
PRODUCT_COPY_FILES += \
    device/huawei/c8650/qwerty.kl:system/usr/keylayout/qwerty.kl
endif

# fstab
PRODUCT_COPY_FILES += \
    device/huawei/c8650/vold.fstab:system/etc/vold.fstab

# close by george,2011-11-14
ifeq (1,0)
# enhanced.conf
PRODUCT_COPY_FILES += \
    device/huawei/c8650/enhanced.conf:system/etc/enhanced.conf
endif

# bluetooth
PRODUCT_COPY_FILES += \
    device/huawei/c8650/init.qcom.bt.sh:system/etc/init.qcom.bt.sh

PRODUCT_COPY_FILES += \
    device/huawei/c8650/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \

# Init
PRODUCT_COPY_FILES += \
    device/huawei/c8650/init.huawei.rc:root/init.huawei.rc \
    device/huawei/c8650/init.rc:root/init.rc \
    device/huawei/c8650/init:root/init \
    device/huawei/c8650/ueventd.rc:root/ueventd.rc

# recovery
#PRODUCT_COPY_FILES += \
#    device/huawei/c8650/recovery/charge:recovery/root/sbin/charge

# Audio
PRODUCT_COPY_FILES += \
    device/huawei/c8650/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/huawei/c8650/prebuilt/etc/AudioPara4.csv:system/etc/AudioPara4.csv \
    device/huawei/c8650/prebuilt/etc/AudioPara4HS.csv:system/etc/AudioPara4HS.csv \
    device/huawei/c8650/prebuilt/etc/AudioPreProcess.csv:system/etc/AudioPreProcess.csv \
    device/huawei/c8650/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt 

#Media profile
PRODUCT_COPY_FILES += \
    device/huawei/c8650/media_profiles.xml:system/etc/media_profiles.xml

# Wifi firmware
PRODUCT_COPY_FILES += \
    device/huawei/c8650/prebuilt/wifi/dhd.ko:system/wifi/dhd.ko \
    device/huawei/c8650/prebuilt/wifi/firmware.bin:system/wifi/firmware.bin \
    device/huawei/c8650/prebuilt/wifi/firmware_apsta.bin:system/wifi/firmware_apsta.bin \
    device/huawei/c8650/prebuilt/wifi/nvram.txt:system/wifi/nvram.txt \

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

# added by george,20111209
PRODUCT_COPY_FILES += \
    device/huawei/c8650/includeX/misc/cpuinfo:system/misc/cpuinfo \
    device/huawei/c8650/includeX/lib/hw/gps.c8650.so:system/lib/hw/gps.c8650.so

# C8800 uses mid-density artwork where available
PRODUCT_LOCALES += mdpi

PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.media.dec.jpeg.memcap=10000000

PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=120 \
    ro.sf.lcd_density=160 \
    qemu.sf.lcd_density=160 \
    ro.com.android.dataroaming=false

#remove to system.prop
#    rild.libargs=-d /dev/smd0 \
#    rild.libpath=/system/lib/libril-qc-1.so \

PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    ro.opengles.version=131072 \
    dalvik.vm.heapsize=48m \
    persist.sys.language=zh \
    persist.sys.country=CN \
    persist.sys.timezone=Asia/Shanghai \
    ro.cdma.home.operator.numeric=46003 \
    ro.telephony.default_network=4 \
    ro.cdma.home.operator.alpha=中国电信 \
    ro.config.cdma_subscription=0 \
    ril.subscription.types=RUIM,NV \
    ro.cdma.voicemail.number=mine \
    ro.com.google.locationfeatures=1 \
    ro.config.no_long_sms=false \
    ro.voicemail.number=*86

# Don't put dexfiles in /cache
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.jpeg.memcap=20000000 \
    ro.telephony.call_ring.multiple=false

# addon
$(call inherit-product-if-exists, addon/addon.mk)
# wifi
$(call inherit-product-if-exists, device/huawei/c8650/wifi/wifi.mk)

# copy default lockscreen theme by shenqi 2011-12-29
PRODUCT_COPY_FILES += \
    lewa/frameworks/lockscreen/HVGA/lockscreen.zip:/system/media/lockscreen.zip \
    lewa/frameworks/theme/HVGA/default.lwt:/system/media/default.lwt

# added by ioz9 for disconnect tethering
PRODUCT_PROPERTY_OVERRIDES += \
    ro.tethering.kb_disconnect=1

# added by ioz9 for speed
PRODUCT_PROPERTY_OVERRIDES += \
    ro.compcache.default=0

# added by ioz9 for adb notify
#PRODUCT_PROPERTY_OVERRIDES += \
#    persist.adb.notify=1

# added by ioz9 for huawei fix
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.hw_fast_dormancy=1 \
    ro.config.helix_enable=false \
    ro.config.hw_camera_resize=true \
    ro.config.hw_front_camera=true \
    ro.config.fm_type=libbcmfm_if \
    hw_internal_sd=true \
    ro.config.hw_virtualsdcard=true

# added by ioz9 for c+w services
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.hw_CplusW=true \
    ro.config.cwenable=1

# added by ioz9 for camera
#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.config.PicMaxSize=3mp

# added by ioz9 for lewa swapper
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lewa.swapper.part_path=/dev/block/mmcblk0p3

# Perfomance tweaks by ioz9
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.heapsize=48m \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.dexopt-data-only=1 \
    ro.sf.hwrotation=0 \
    debug.sf.hw=1 \
    windowsmgr.max_events_per_sec=120 \
    video.accelerate.hw=1 \
    debug.composition.type=gpu \
    debug.performance.tuning=1
