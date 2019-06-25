# openwrt-random-mac-changer
OpenWrt change MAC adres on any interface


MAC address changer script:

Initialize on startup:

<code>
$ /etc/init.d/mac-change.sh enable
</code>

<code>
$ /etc/init.d/mac-change.sh enabled && echo on
on
</code>

You can use logread to debug the script. More info on init scripts: https://openwrt.org/docs/techref/initscripts

If you want to change your MAC address every 3 hours leverage the crontab utilty:

<code>
/etc/init.d/cron start
/etc/init.d/cron enable
</code>

<code>
crontab -e
* 3 * * * /etc/init.d/mac-change.sh start
</code>
<code>
crontab -l
* 3 * * * /etc/init.d/mac-change.sh start
</code>
