# openwrt-random-mac-changer
OpenWrt change MAC adres on any interface


MAC address changer script:

source: https://openwrt.org/docs/techref/initscripts

Initialize on startup:

$ /etc/init.d/mac-change.sh enable
$ /etc/init.d/mac-change.sh enabled && echo on
on

you can use logread to debug the script

If you want to change your MAC address every 3 hours for example leverage crontab utilty:
https://openwrt.org/docs/guide-user/base-system/cron

/etc/init.d/cron start
/etc/init.d/cron enable

crontab -e
* 3 * * * /etc/init.d/mac-change.sh start

crontab -l
* 3 * * * /etc/init.d/mac-change.sh start
