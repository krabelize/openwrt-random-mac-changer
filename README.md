# openwrt-random-mac-changer
OpenWrt change MAC adres on any interface. Change th OUI of the MAC adres to a [legitmate NIC](https://mac2vendor.com/) vendor for RFC complaincy. 

MAC address changer script:

Initialize on startup:

```bash
$ chmod +x /etc/init.d/mac-change.sh
$ /etc/init.d/mac-change.sh enable
```

```bash
$ /etc/init.d/mac-change.sh enabled && echo on
on
```
Use the `logread` command to for debugging and troubleshooting the script.

You can use logread to debug the script. More info on [init scripts.](https://openwrt.org/docs/techref/initscripts)

If you want to change your MAC address every 3 hours leverage the crontab utilty:

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

