mount -o rw,remount -t ext4 /dev/block/platform/s3c-sdhci.0/by-name/system /system
echo 设立内存管理机制为 0,0,0,0,20000,22500
echo "0,0,0,0,20000,22500"  >  "/sys/module/lowmemorykiller/parameters/minfree"

echo 设立swap策略为100%（内置的和运行内存是一样的，可以直接通用，所以设置高点好）
echo 99 > /proc/sys/vm/swappiness


busybox umount /dev/block/mtdblock5
busybox umount /dev/block/mtdblock7
busybox mount -o rw /dev/block/mtdblock7 /cache
busybox mount -o rw /dev/block/mtdblock5 /swap


if [ ! -f "/swap/swap.img" ]
then
if [ ! -e "/dev/block/mmcblk0p3" ]
then
if [ ! -e "/system/noinswap" ]
then
echo 不存在swap.img，新建一个。sd-ext已经放置在93m的cache分区，cache内容挂载在之前没有利用的userdata2上面，20m左右的空间。
busybox rm -rf /swap/*
busybox mount -o rw /swap;
busybox dd if=/dev/zero of=/swap/swap.img bs=1024 count=85008;
echo 新建完成。
fi
fi
fi


if [ -f "/swap/swap.img" ]
then
if [ ! -e "/dev/block/mmcblk0p3" ]
then
if [ ! -e "/system/noinswap" ]
then
echo 存在swap.img，设立swap。
busybox losetup /dev/block/loop7 /swap/swap.img;
busybox mkswap /dev/block/loop7;
busybox swapon /dev/block/loop7;
echo 设立完成。
fi
fi
fi
#/dev/block/mtdblock5 90m
#/dev/block/mtdblock7 20m

if [ -e "/dev/block/mmcblk0p3" ]
then
busybox rm -rf /swap/swap.img
busybox mkswap /dev/block/mmcblk0p3;
busybox mkswap	/dev/block/mmcblk0p3;
busybox swapon	/dev/block/mmcblk0p3;
sysctl -w vm.swappiness=40;
fi

if [ -e "/dev/block/mmcblk0p3" ]
then
    busybox rm -rf /swap/*
    busybox umount /dev/block/mtdblock5
    busybox umount /dev/block/mtdblock7
    busybox mount -o rw /dev/block/mtdblock5 /cache
    busybox mount -o rw /dev/block/mtdblock7 /swap
fi

if [ -e "/system/noinswap" ]
then
    busybox rm -rf /swap/*
    busybox umount /dev/block/mtdblock5
    busybox umount /dev/block/mtdblock7
    busybox mount -o rw /dev/block/mtdblock5 /cache
    busybox mount -o rw /dev/block/mtdblock7 /swap
fi

busybox rm -rf /cache/*
busybox mkdir /cache/download
busybox chmod 777 /cache/download

/system/bin/wpa_supplicant -Dwext -ieth0 -c /data/misc/wifi/wpa_supplicant.conf

busybox chmod 0777 /dev/*;
busybox chown system.system /dev/*;
mount -o ro,remount -t ext4 /dev/block/platform/s3c-sdhci.0/by-name/system /system

