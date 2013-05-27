#!/bin/sh

mkdir -p ../../../vendor/huawei/c8650/proprietary

DIRS="
bin
etc/wifi
lib/hw
lib/egl
wifi
"
for DIR in $DIRS; do
	mkdir -p ../../../vendor/huawei/c8650/proprietary/$DIR
done

FILES="
etc/vold.fstab
etc/init.qcom.bt.sh
etc/apns-conf.xml
etc/wifi/wpa_supplicant.conf
etc/AudioFilter.csv
etc/AutoVolumeControl.txt
etc/firmware/yamato_pfp.fw
etc/firmware/yamato_pm4.fw
etc/init.qcom.coex.sh
etc/init.qcom.fm.sh
etc/init.qcom.post_boot.sh
etc/init.qcom.sdio.sh
etc/bluetooth/BCM4329.hcd

wifi/dhd.ko
wifi/firmware.bin
wifi/firmware_apsta.bin
wifi/nvram.txt
wifi/bcm_loadecho.sh
wifi/bcm_loadipf.sh
wifi/connectap.sh
wifi/iwconfig
wifi/iwlist
wifi/iwpriv
wifi/nvram.txt
wifi/udp_server

lib/libril-qc-1.so
lib/libril-qcril-hook-oem.so
lib/libgsl.so
lib/libdiag.so
lib/libcm.so
lib/liboncrpc.so
lib/libqmi.so
lib/libdsm.so
lib/libqueue.so
lib/libdll.so
lib/libmmgsdilib.so
lib/libgsdi_exp.so
lib/libgstk_exp.so
lib/libwms.so
lib/libnv.so
lib/libwmsts.so
lib/libpbmlib.so
lib/libdss.so
lib/libauth.so
lib/libcamera.so
lib/liboemcamera.so
lib/libcameraservice.so
lib/libcamera_client.so
lib/libmmjpeg.so
lib/libmmipl.so
lib/libmm-adspsvc.so
lib/libOmxAacDec.so
lib/libOmxWmvDec.so
lib/libOmxAdpcmDec.so
lib/libOmxH264Dec.so
lib/libOmxAmrDec.so
lib/libOmxAmrwbDec.so
lib/libOmxWmaDec.so
lib/libOmxMp3Dec.so
lib/libOmxMpeg4Dec.so
lib/libOmxAmrRtpDec.so
lib/libOmxAacEnc.so
lib/libOmxEvrcEnc.so
lib/libOmxAmrEnc.so
lib/libOmxQcelp13Enc.so
lib/libOmxVidEnc.so
lib/libomx_aacdec_sharedlibrary.so
lib/libomx_amrdec_sharedlibrary.so
lib/libomx_amrenc_sharedlibrary.so
lib/libomx_avcdec_sharedlibrary.so
lib/libomx_m4vdec_sharedlibrary.so
lib/libomx_mp3dec_sharedlibrary.so
lib/libomx_sharedlibrary.so
lib/libreference-ril.so
lib/libril.so
lib/liboem_rapi.so
lib/libcommondefs.so
lib/libloc_api-rpc-qc.so
lib/libmmprocess.so
lib/libhwrpc.so

bin/oem_rpc_svc
bin/vold
bin/modempre
bin/wpa_supplicant
bin/wl
bin/port-bridge
bin/brcm_patchram_plus
bin/qmuxd
bin/akmd8962
bin/akmd8975
bin/compassd

lib/hw/sensors.default.so
lib/hw/lights.msm7k.so
lib/hw/copybit.msm7k.so
lib/hw/gralloc.msm7k.so
lib/hw/gps.default.so

lib/egl/libEGL_adreno200.so
lib/egl/libGLESv2_adreno200.so
lib/egl/libGLESv1_CM_adreno200.so
lib/egl/libq3dtools_adreno200.so
"
for FILE in $FILES; do
	adb pull system/$FILE ../../../vendor/huawei/c8650/proprietary/$FILE
done

chmod 755 ../../../vendor/huawei/c8650/proprietary/bin/* 
