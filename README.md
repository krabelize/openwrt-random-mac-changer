# openwrt-random-mac-changer
OpenWrt change MAC adres on any interface


MAC address changer script:

Initialize on startup:

`
$ /etc/init.d/mac-change.sh enable
`

`
$ /etc/init.d/mac-change.sh enabled && echo on
on
`

You can use logread to debug the script. More info on init scripts: https://openwrt.org/docs/techref/initscripts

If you want to change your MAC address every 3 hours leverage the crontab utilty:

`
/etc/init.d/cron start
/etc/init.d/cron enable
`

`crontab -e
* 3 * * * /etc/init.d/mac-change.sh start`
