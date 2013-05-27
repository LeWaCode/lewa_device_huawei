# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, device/common/gps/gps_cn.mk)

DEVICE_PACKAGE_OVERLAYS := device/huawei/u8800x/overlay

# Discard inherited values and use our own instead.
PRODUCT_NAME := huawei_u8800
PRODUCT_DEVICE := u8800x
PRODUCT_MODEL := huawei u8800

PRODUCT_LOCALES := zh_CN en_US zh_TW

#add Torch by gbli
#add Gallery#D by shenqi 1214
PRODUCT_PACKAGES += \
    librs_jni \
    overlay.default \
    gps.u8800 \
    libOmxCore \
    libOmxVidEnc \
    dexpreopt \
    load_libra \
    Torch

#liuhao removed, use PicFolder.apk 
#    Gallery3D \

#    X5settings \
#    Term \
#    LiveWallpapers \
#    LiveWallpapersPicker \
#    VisualizationWallpapers \
#    MagicSmokeWallpapers \
#    SpareParts \

#PRODUCT_PACKAGES += \
#    rmt_storage \
#    offmode_charge \
#    offmode_check \
#    fix_permissions \
#    parted \
#    sdparted \
#    e2fsck \
#    tune2fs \
#    mke2fs \
#    killrecovery.sh \
#   nandroid-md5.sh \
#    libvold \

# proprietary side of the device
$(call inherit-product-if-exists, vendor/huawei/u8800x/u8800x-vendor.mk)

DISABLE_DEXPREOPT := false

PRODUCT_COPY_FILES += \
    device/huawei/u8800x/qwerty.kl:system/usr/keylayout/qwerty.kl

# Init
PRODUCT_COPY_FILES += \
    device/huawei/u8800x/init.u8800x.rc:root/init.u8800.rc \
    device/huawei/u8800x/init.rc:root/init.rc \
    device/huawei/u8800x/init:root/init \
    device/huawei/u8800x/initlogo.rle:root/initlogo.rle \
    device/huawei/u8800x/prebuilt/restart-ms:root/sbin/restart-ms \

# adbd
#PRODUCT_COPY_FILES += \
#    device/huawei/u8800x/adbd:root/sbin/adbd \

# fstab
PRODUCT_COPY_FILES += \
    device/huawei/u8800x/vold.fstab:system/etc/vold.fstab

# enhanced.conf
PRODUCT_COPY_FILES += \
    device/huawei/u8800x/enhanced.conf:system/etc/enhanced.conf

# Init
PRODUCT_COPY_FILES += \
    device/huawei/u8800x/init.u8800x.rc:root/init.u8800x.rc \
    device/huawei/u8800x/ueventd.huawei.rc:root/ueventd.huawei.rc \
    device/huawei/u8800x/init.qcom.post_boot.sh:root/init.qcom.post_boot.sh \
    device/huawei/u8800x/init.qcom.sh:root/init.qcom.sh

PRODUCT_COPY_FILES += \
    device/huawei/u8800x/init.goldfish.sh:system/etc/init.goldfish.sh \
    device/huawei/u8800x/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    device/huawei/u8800x/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
    device/huawei/u8800x/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
    device/huawei/u8800x/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    device/huawei/u8800x/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \
    device/huawei/u8800x/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh \
    device/huawei/u8800x/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/huawei/u8800x/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/huawei/u8800x/media_profiles.xml:system/etc/media_profiles.xml

# WLAN firmware
PRODUCT_COPY_FILES += \
    device/huawei/u8800x/firmware/wlan/cfg.dat:system/etc/firmware/wlan/cfg.dat \
    device/huawei/u8800x/firmware/wlan/hostapd_default.conf:system/etc/firmware/wlan/hostapd_default.conf \
    device/huawei/u8800x/firmware/wlan/qcom_cfg.ini:system/etc/firmware/wlan/qcom_cfg.ini \
    device/huawei/u8800x/firmware/wlan/qcom_fw.bin:system/etc/firmware/wlan/qcom_fw.bin \
    device/huawei/u8800x/firmware/wlan/qcom_wapi_fw.bin:system/etc/firmware/wlan/qcom_wapi_fw.bin \
    device/huawei/u8800x/firmware/wlan/qcom_wlan_nv.bin:system/etc/firmware/wlan/qcom_wlan_nv.bin

# vidc firmware
PRODUCT_COPY_FILES += \
    device/huawei/u8800x/firmware/vidc_720p_command_control.fw:/system/etc/firmware/vidc_720p_command_control.fw \
    device/huawei/u8800x/firmware/vidc_720p_h263_dec_mc.fw:/system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    device/huawei/u8800x/firmware/vidc_720p_h264_dec_mc.fw:/system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    device/huawei/u8800x/firmware/vidc_720p_h264_enc_mc.fw:/system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    device/huawei/u8800x/firmware/vidc_720p_mp4_dec_mc.fw:/system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    device/huawei/u8800x/firmware/vidc_720p_mp4_enc_mc.fw:/system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    device/huawei/u8800x/firmware/vidc_720p_vc1_dec_mc.fw:/system/etc/firmware/vidc_720p_vc1_dec_mc.fw \

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

#WIFI Modules
PRODUCT_COPY_FILES += \
    device/huawei/u8800x/prebuilt/libra.ko:/system/lib/modules/libra.ko \
    device/huawei/u8800x/prebuilt/librasdioif.ko:/system/lib/modules/librasdioif.ko \
    device/huawei/u8800x/prebuilt/libra.ko:/system/lib/modules/libra_ftm.ko \
# proprietary side of the device
#$(call inherit-product-if-exists, vendor/huawei/u8800x/u8800x-vendor.mk)

#Unlock FPS as default by zarey.
PRODUCT_COPY_FILES += \
    device/huawei/u8800x/prebuilt/etc/init.d/77unlockfps:/system/etc/init.d/77unlockfps \

#Haptic vibrate Setting
PRODUCT_COPY_FILES += \
    device/huawei/u8800x/prebuilt/etc/init.d/30vibrate:/system/etc/init.d/30vibrate \
    device/huawei/u8800x/prebuilt/misc/30vibrate.conf:/system/misc/30vibrate.conf \

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.build.baseband_version=129005 \
    ro.telephony.default_network=0 \
    ro.telephony.call_ring.multiple=false \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \


PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-1.so \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=120 \
    ro.com.android.dataroaming=false

#remove to system.prop
#    rild.libargs=-d /dev/smd0 \

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    persist.sys.language=zh \
    persist.sys.country=CN \
    persist.sys.timezone=Asia/Shanghai

PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.hwfeature_slavecamera=yes \
    ro.config.hwcameraset=63 \
    hw.secondary_mic=0 \
    ro.config.hw_addsettingsdbex=1 \
    ro.config.hw_gcf_mms=true \
    ro.config.wifi_chip_is_bcm=false \
    ro.config.hwft_PNN_function=true \
    persist.cust.tel.adapt=1 \
    persist.cust.tel.eons=1 \
    ro.config.hwfeature_gps_test=0 \
    ro.config.hwfeature_ecc=true \
    ro.config.lowbattery_shutdown=1 \
    ro.config.hwfeature_wakeupkey=1 \
    ro.config.endkeybehavior=true \
    ro.config.hw_menu_unlockscreen=false \
    ro.media.enc.lprof.duration=30 \
    ro.config.PicMaxSize=5mp \
    ro.config.hw_temperature_warn=true \
    ro.config.hw_clocksetting=0 \
    mot.proximity.delay=150 \
    ro.additionalmounts=/HWUserData \
    ro.vold.switchablepair=/mnt/sdcard,/HWUserData \
    ro.vold.umsdirtyratio=20 \

# u8800x uses high-density artwork where available
PRODUCT_LOCALES += hdpi

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# This should not be needed but on-screen keyboard uses the wrong density without it.
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.sf.lcd_density=240 


PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.jpeg.memcap=20000000 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.heapsize=32m \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.dexopt-data-only=1 \
    ro.opengles.version=131072  \
    ro.compcache.default=0

# added by george,for swapper
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lewa.swapper.part_path=/dev/block/mmcblk1p3
	
# copy default lockscreen theme by shenqi 2011-12-29

PRODUCT_COPY_FILES += \
         lewa/frameworks/lockscreen/WVGA/lockscreen.zip:/system/media/lockscreen.zip \
         lewa/frameworks/theme/WVGA/default.lwt:/system/media/default.lwt

