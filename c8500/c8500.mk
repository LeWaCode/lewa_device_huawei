# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_small.mk)

# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_us_supl.mk)

#$(call inherit-product-if-exists, vendor/huawei/c8500/c8500-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/huawei/c8500/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/huawei/c8500/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_PACKAGES += \
    copybit.c8500 \
    gps.c8500 \
    libRS \
    hwprops \
    rzscontrol \
    libOmxCore \
    libmm-omxcore \
    libOmxVidEnc \
    CMParts \
    Email \
    load_wifi

#liuhao removed, use PicFolder.apk 
#    Gallery \

# removed,by george,20111026
#    FileManager \
#    AndroidTerm \
#    Stk


# Live Wallpapers
PRODUCT_PACKAGES += \
    librs_jni 
    
# removed,by george,20111026    
#    LiveWallpapersPicker

# Live Wallpapers support
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# vold
PRODUCT_COPY_FILES += \
    device/huawei/c8500/include/etc/vold.fstab:system/etc/vold.fstab

# Compcache module
PRODUCT_COPY_FILES += \
    device/huawei/c8500/modules/ramzswap.ko:system/lib/modules/ramzswap.ko

#    device/huawei/c8500/default.prop:root/default.prop


# DHCP config for wifi
PRODUCT_COPY_FILES += \
    device/huawei/c8500/include/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

# Keylayouts
PRODUCT_COPY_FILES += \
    device/huawei/c8500/keychars/surf_keypad.kcm.bin:system/usr/keychars/surf_keypad.kcm.bin \
    device/huawei/c8500/keylayout/surf_keypad.kl:system/usr/keylayout/surf_keypad.kl \
    device/huawei/c8500/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/com.tmobile.software.themes.xml:system/etc/permissions/com.tmobile.software.themes.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/platform.xml:system/etc/permissions/platform.xml


PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=120 \
    ro.sf.lcd_density=120 \
    ro.com.android.dataroaming=false

# Default network type
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=4
    ro.cdma.home.operator.numeric=46003
    ro.cdma.home.operator.alpha=中国电信
    ro.config.cdma_subscription=0 \
    ril.subscription.types=RUIM,NV \
    ro.cdma.voicemail.number=mine \

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=65537

# Perfomance tweaks
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.heapsize=24m \
    persist.sys.use_dithering=0 \
    persist.sys.purgeable_assets=1 \
    ro.compcache.default=0

# Don't put dexfiles in /cache on c8500
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1

# add base-band,by george,2011-10-17
PRODUCT_PROPERTY_OVERRIDES += \
    o.build.baseband_version=2210 \

# Media configuration xml file
PRODUCT_COPY_FILES += \
    device/huawei/c8500/include/etc/media_profiles.xml:system/etc/media_profiles.xml

# wpa_supplicant configuration file
# by george,2011-10-17
ifeq (1,1)
PRODUCT_COPY_FILES += \
    device/huawei/c8500/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/huawei/c8500/wpa_supplicant.conf:etc/wifi/wpa_supplicant.conf 
else
PRODUCT_COPY_FILES += \
    device/huawei/c8500/include/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf
endif

# Proprietary hardware related
PRODUCT_COPY_FILES += \
    vendor/huawei/c8500/proprietary/lib/libcamera.so:obj/lib/libcamera.so \
    vendor/huawei/c8500/proprietary/lib/libcamera.so:system/lib/libcamera.so \
    vendor/huawei/c8500/proprietary/lib/libqcamera.so:system/lib/libqcamera.so \
    vendor/huawei/c8500/proprietary/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
    vendor/huawei/c8500/proprietary/lib/libmmipl.so:system/lib/libmmipl.so \
    vendor/huawei/c8500/proprietary/lib/libmmprocess.so:system/lib/libmmprocess.so \
    vendor/huawei/c8500/proprietary/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh

# Sound and OMX
PRODUCT_COPY_FILES += \
    device/huawei/c8500/include/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/huawei/c8500/include/etc/AudioFilterC8150.csv:system/etc/AudioFilterC8150.csv \
    device/huawei/c8500/include/etc/AudioFilterC8500.csv:system/etc/AudioFilterC8500.csv \
    device/huawei/c8500/include/etc/AudioFilterC8600.csv:system/etc/AudioFilterC8600.csv \
    device/huawei/c8500/include/etc/AudioFilterM860.csv:system/etc/AudioFilterM860.csv \
    device/huawei/c8500/include/etc/AudioFilterU8100.csv:system/etc/AudioFilterU8100.csv \
    device/huawei/c8500/include/etc/AudioFilterU8110.csv:system/etc/AudioFilterU8110.csv \
    device/huawei/c8500/include/etc/AudioFilterU8120.csv:system/etc/AudioFilterU8120.csv \
    device/huawei/c8500/include/etc/AudioFilterU8150.csv:system/etc/AudioFilterU8150.csv \
    device/huawei/c8500/include/etc/AudioFilterU8300.csv:system/etc/AudioFilterU8300.csv \
    device/huawei/c8500/include/etc/AudioFilterU8500.csv:system/etc/AudioFilterU8500.csv \
    device/huawei/c8500/include/etc/AudioFilterUM840.csv:system/etc/AudioFilterUM840.csv \
    device/huawei/c8500/include/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    vendor/huawei/c8500/proprietary/lib/libaudioeq.so:system/lib/libaudioeq.so \
    vendor/huawei/c8500/proprietary/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    vendor/huawei/c8500/proprietary/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    vendor/huawei/c8500/proprietary/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    vendor/huawei/c8500/proprietary/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so

# OEM logo and boot splash
PRODUCT_COPY_FILES += \
    device/huawei/c8500/initlogo.rle:root/initlogo.rle

# Lights and graphics
PRODUCT_COPY_FILES += \
    vendor/huawei/c8500/proprietary/lib/hw/gralloc.msm7k.so:system/lib/hw/gralloc.msm7k.so 

#vendor/huawei/c8500/proprietary/lib/hw/lights.msm7k.so:system/lib/hw/lights.msm7k.so

# Sensors
PRODUCT_COPY_FILES += \
    vendor/huawei/c8500/proprietary/bin/akmd2:system/bin/akmd2 \
    vendor/huawei/c8500/proprietary/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so


# Sensors,by george,2011-10-17
PRODUCT_COPY_FILES += \
    device/huawei/c8500/includeX/lib/libsensorservice.so:system/lib/libsensorservice.so

# fix UI shift from left and the light can't be closed,by george,2011-10-20
PRODUCT_COPY_FILES += \
    device/huawei/c8500/includeX/lib/hw/gralloc.c8500.so:system/lib/hw/gralloc.c8500.so \
    device/huawei/c8500/includeX/lib/hw/gralloc.msm7k.so:system/lib/hw/gralloc.msm7k.so \
    device/huawei/c8500/includeX/lib/hw/gralloc.default.so:system/lib/hw/gralloc.default.so \

PRODUCT_COPY_FILES += \
    device/huawei/c8500/includeX/lib/hw/copybit.msm7k.so:system/lib/hw/copybit.msm7k.so \
    device/huawei/c8500/includeX/lib/hw/copybit.c8500.so:system/lib/hw/copybit.c8500.so 

PRODUCT_COPY_FILES += \
    device/huawei/c8500/includeX/lib/hw/gps.msm7k.so:system/lib/hw/gps.msm7k.so \
    device/huawei/c8500/includeX/lib/hw/gps.c8500.so:system/lib/hw/gps.c8500.so 

PRODUCT_COPY_FILES += \
    device/huawei/c8500/includeX/lib/hw/lights.c8500.so:system/lib/hw/lights.c8500.so \
    device/huawei/c8500/includeX/lib/hw/lights.msm7k.so:system/lib/hw/lights.msm7k.so 


# GPS
PRODUCT_COPY_FILES += \
    device/huawei/c8500/include/etc/gps.conf:system/etc/gps.conf
    device/huawei/c8500/include/autorun.iso:system/cdrom/autorun.iso

# Proprietary RIL related
PRODUCT_COPY_FILES += \
    vendor/huawei/c8500/proprietary/lib/libauth.so:system/lib/libauth.so \
    vendor/huawei/c8500/proprietary/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
    vendor/huawei/c8500/proprietary/lib/libril.so:system/lib/libril.so \
    vendor/huawei/c8500/proprietary/lib/liboncrpc.so:system/lib/liboncrpc.so \
    vendor/huawei/c8500/proprietary/lib/libdsm.so:system/lib/libdsm.so \
    vendor/huawei/c8500/proprietary/lib/libqueue.so:system/lib/libqueue.so \
    vendor/huawei/c8500/proprietary/lib/libcm.so:system/lib/libcm.so \
    vendor/huawei/c8500/proprietary/lib/libdiag.so:system/lib/libdiag.so \
    vendor/huawei/c8500/proprietary/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    vendor/huawei/c8500/proprietary/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \
    vendor/huawei/c8500/proprietary/lib/libgstk_exp.so:system/lib/libgstk_exp.so \
    vendor/huawei/c8500/proprietary/lib/libwms.so:system/lib/libwms.so \
    vendor/huawei/c8500/proprietary/lib/libnv.so:system/lib/libnv.so \
    vendor/huawei/c8500/proprietary/lib/libwmsts.so:system/lib/libwmsts.so \
    vendor/huawei/c8500/proprietary/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
    vendor/huawei/c8500/proprietary/lib/libdss.so:system/lib/libdss.so \
    vendor/huawei/c8500/proprietary/lib/libdll.so:system/lib/libdll.so \
    vendor/huawei/c8500/proprietary/lib/libqmi.so:system/lib/libqmi.so \
    vendor/huawei/c8500/proprietary/lib/libpbmlib.so:system/lib/libpbmlib.so \
    vendor/huawei/c8500/proprietary/lib/libwpa_client.so:system/lib/libwpa_client.so \
    vendor/huawei/c8500/proprietary/bin/qmuxd:system/bin/qmuxd \
    vendor/huawei/c8500/proprietary/bin/hci_qcomm_init:system/bin/hci_qcomm_init

# apns-conf.xml added by george,2011-10-19,only cmcc and unicom apns, boot quickly
PRODUCT_COPY_FILES += \
    device/huawei/c8500/include/etc/apns-conf.xml:system/etc/apns-conf.xml

# ril added by george,2011-10-17
PRODUCT_COPY_FILES += \
    device/huawei/c8500/includeX/bin/rild:system/bin/rild

# OEM RPC
PRODUCT_COPY_FILES += \
    vendor/huawei/c8500/proprietary/bin/modempre:system/bin/modempre \
    vendor/huawei/c8500/proprietary/bin/oem_rpc_svc:system/bin/oem_rpc_svc \
    vendor/huawei/c8500/proprietary/lib/libhwrpc.so:system/lib/libhwrpc.so \
    vendor/huawei/c8650/proprietary/lib/libhwrpc.so:obj/lib/libhwrpc.so \
    vendor/huawei/c8500/proprietary/lib/liboem_rapi.so:system/lib/liboem_rapi.so

## Wifi related
PRODUCT_COPY_FILES += \
    device/huawei/c8500/modules/bcm4319.ko:system/lib/modules/bcm4319.ko \
    device/huawei/c8500/include/etc/firmware/fw_bcm4319.bin:system/etc/firmware/fw_bcm4319.bin \
    device/huawei/c8500/include/etc/firmware/fw_bcm4319_apsta.bin:system/etc/firmware/fw_bcm4319_apsta.bin \
    device/huawei/c8500/include/etc/firmware/nvram.txt:system/etc/firmware/nvram.txt

## wifi added by george,2011-10-17
PRODUCT_COPY_FILES += \
    device/huawei/c8500/includeX/bin/wificit.sh:system/bin/wificit.sh \
    device/huawei/c8500/includeX/bin/bcm_supplicant:system/bin/bcm_supplicant \
    device/huawei/c8500/includeX/bin/bcm_wlcoex:system/bin/bcm_wlcoex \
    device/huawei/c8500/includeX/bin/wlan_tool:system/bin/wlan_tool \
    device/huawei/c8500/includeX/bin/wpa_supplicant:system/bin/wpa_supplicant \
    device/huawei/c8500/includeX/bin/btwlancoex:system//bin/btwlancoex \
    device/huawei/c8500/includeX/bin/wl:system/bin/wl \
    device/huawei/c8500/includeX/bin/wpa_cli:system/bin/wpa_cli

PRODUCT_COPY_FILES += \
    device/huawei/c8500/includeX/lib/modules/bcm4319.ko:system/lib/modules/bcm4319.ko \
    device/huawei/c8500/includeX/lib/modules/dhd.ko:system/lib/modules/dhd.ko \
    device/huawei/c8500/includeX/etc/firmware/firmware.bin:system/etc/firmware/firmware.bin

## audio patch from slax,2011-10-20
ifeq (1,0)
PRODUCT_COPY_FILES += \
    device/huawei/c8500/includeX/lib/libaudioflinger.so:system/lib/libaudioflinger.so \
    device/huawei/c8500/includeX/lib/libaudio.so:system/lib/libaudio.so
else
PRODUCT_COPY_FILES += \
    device/huawei/c8500/includeX/bt_patch/libaudioflinger.so:system/lib/libaudioflinger.so \
    device/huawei/c8500/includeX/bt_patch/libaudio.so:system/lib/libaudio.so \
    device/huawei/c8500/includeX/bt_patch/libbluetooth.so:system/lib/libbluetooth.so \
    device/huawei/c8500/includeX/bt_patch/libbluetoothd.so:system/lib/libbluetoothd.so
endif


## end 

$(call inherit-product, build/target/product/small_base.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := generic_c8500
PRODUCT_DEVICE := c8500
PRODUCT_MODEL := Huawei_c8500

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-huawei-us \
    ro.com.google.locationfeatures=1 \
    keyguard.no_require_sim=
    ro.setupwizard.enable_bypass=1 \
    ro.config.play.bootsound=0

# by george,2011-10-17
##Added Files for bootsound and themes
#PRODUCT_COPY_FILES += \
#    device/huawei/c8500/include/app/ThemeChooser.apk:system/app/ThemeChooser.apk \
#    device/huawei/c8500/include/app/ThemeManager.apk:system/app/ThemeManager.apk \
#    device/huawei/c8500/include/app/rootexplorer.apk:system/app/rootexplorer.apk   \
#    device/huawei/c8500/include/app/noFrillsCPU.apk:system/app/noFrillsCPU.apk \
#    device/huawei/c8500/include/bin/bootsound:system/bin/bootsound \
#    device/huawei/c8500/include/media/audio/ui/android_audio.mp3:system/media/audio/ui/android_audio.mp3 \
#    device/huawei/c8500/include/media/bootanimation.zip:system/media/bootanimation.zip \

PRODUCT_COPY_FILES += \
    device/huawei/c8500/include/etc/init.local.rc:system/etc/init.local.rc 

##Screen Rotation Fix
#    device/huawei/c8500/include/lib/libui.so:system/lib/libui.so

##No Ads Host file
PRODUCT_COPY_FILES += \
    device/huawei/c8500/include/etc/hosts:system/etc/hosts

# added by george
# Init
#PRODUCT_COPY_FILES += \
#    device/huawei/ueventd.qcom.rc:root/ueventd.qcom.rc

PRODUCT_COPY_FILES += \
    device/huawei/c8500/init.rc:root/init.rc \
    device/huawei/c8500/init.huawei.rc:root/init.huawei.rc \
    device/huawei/c8500/ueventd.huawei.rc:root/ueventd.huawei.rc 

PRODUCT_COPY_FILES += \
    device/huawei/c8500/includeX/misc/cpuinfo:/system/misc/cpuinfo \

#    device/huawei/c8500/superboot/superboot.sh:root/superboot/superboot.sh

# c8500 only use two language for lewa branch
PRODUCT_LOCALES := zh_CN en_US

# c8500 uses middle-density artwork where available
PRODUCT_LOCALES += ldpi mdpi

# copy default lockscreen theme by shenqi 2011-12-29

PRODUCT_MODEL := c8500
PRODUCT_BRAND := huawei
PRODUCT_MANUFACTURER := huawei
