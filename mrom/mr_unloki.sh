#!/sbin/sh

if [ "$1" = "/dev/block/mmcblk0p7" ]; then
	echo "Unloking internal boot.img"
	dd if=/dev/block/platform/msm_sdcc.1/by-name/boot of=/tmp/boot.img
	if [ -e /tmp/boot.img ]; then
		mv /tmp/boot.img /tmp/boot.lok
		/sbin/loki_tool unlok /tmp/boot.lok /tmp/boot.img || exit 1
		echo "Internal boot.img unlokid, flashing it back"
		dd if=/tmp/boot.img of=/dev/block/mmcblk0p7
		rm -rf /tmp/boot.lok
	else
		echo "Unloking internal boot.img failed"
		exit 1
	fi
	exit 0
else
	echo "Unloking boot.img in $1"
	if [ -e "$1/boot.img" ]; then
		mv "$1/boot.img" /tmp/boot.lok
		/sbin/loki_tool unlok /tmp/boot.lok /tmp/boot.img
		mv /tmp/boot.img "$1/boot.img"
		rm -rf /tmp/boot.lok
	else
		echo "No boot.img foung in $1"
		exit 1
	fi	
fi
