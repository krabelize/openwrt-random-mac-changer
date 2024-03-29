# OpenWrt random MAC changer
This script changes the MAC address on OpenWrt on any specified (v)NIC interface. Change th OUI of the MAC address in line 13 to a [legitmate NIC](https://mac2vendor.com/) vendor for [RFC and IEEE compliancy](http://standards-oui.ieee.org/oui.txt). The 802.1X authentication server might have a validator in place to check spoofed MAC addresses against the above IEEE database. 

Read [this blog post](https://cryptsus.com/blog/openwrt-wireless-access-point-bridge-802.1x-peap.html) for more information.

Install MAC address changer script:

Initialize on startup:
```bash
$ chmod +x /etc/init.d/mac-change.sh
$ /etc/init.d/mac-change.sh enable
```
Verify:
```bash
$ /etc/init.d/mac-change.sh enabled && echo on
on
```
Edit `/etc/rc.local` to execute on startup in case the init is too slow:
```bash
$ vi /etc/rc.local
/etc/init.d/mac-change.sh start
exit 0
```
Use the `logread` command to for debugging and troubleshooting the script. More info on [init scripts.](https://openwrt.org/docs/techref/initscripts)

Leverage the `crontab` utilty if you want to change your MAC address every 3 hours:
```bash
$ /etc/init.d/cron start
```

```bash
$ /etc/init.d/cron enable
```

```bash
$ crontab -e
* 3 * * * /etc/init.d/mac-change.sh start
```
Verify:
```bash
$ crontab -l
* 3 * * * /etc/init.d/mac-change.sh start
```
# License
Berkeley Software Distribution (BSD)

# Author
[Jeroen van Kessel](https://twitter.com/jeroenvkessel) | [cryptsus.com](https://cryptsus.com) - we craft cyber security solutions
