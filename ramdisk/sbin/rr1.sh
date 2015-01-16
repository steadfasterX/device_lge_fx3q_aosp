#!/sbin/sh

/sbin/busybox dmesg > /tmp/dmesg.txt
hkp=`/sbin/busybox grep -cim1 "HOME KEY PRESS" /tmp/dmesg.txt`
/sbin/setprop ro.r.r $hkp
