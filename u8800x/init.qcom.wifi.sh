wifishd=`getprop wlan.driver.status`
case "$wifishd" in
    "ok")
       ;;
    "loading")
       ;;
     *)
       sh /system/etc/init.qcom.sdio.sh 1
       insmod /system/lib/modules/librasdioif.ko
       insmod /system/lib/modules/libra.ko
       rmmod libra.ko
       rmmod librasdioif.ko
       sh /system/etc/init.qcom.sdio.sh 0
       ;;
esac

exit 0
