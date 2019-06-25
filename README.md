# OpenWrt random MAC changer
OpenWrt change MAC adres on any interface. Change th OUI of the MAC adres to a [legitmate NIC](https://mac2vendor.com/) vendor for [RFC and IEEE compliancy](http://standards-oui.ieee.org/oui.txt). Furthermore, the 802.1X authentication server might have a validator in place to check spoofed MAC addresses.

Install MAC adres changer script:

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
```bash
$ crontab -l
* 3 * * * /etc/init.d/mac-change.sh start
```
# License
GNU General Public License v3.0

# Author
[Jeroen van Kessel](https://twitter.com/jeroenvkessel) | [cryptsus.com](https://cryptsus.com) - we craft cyber security solutions
