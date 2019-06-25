#!/bin/sh /etc/rc.common
#MAC address changer script
#Make sure the OUI of the MAC address matches a client side wireless NIC vendor
#Place this script in /etc/init.d/

START=94
STOP=20

start() {
   interface="wlan0"
   current_mac=$(ifconfig ${interface} | grep "HWaddr" | awk '{print$5}')
   new_mac=$(dd if=/dev/random bs=1 count=3 2>/dev/null | hexdump -C | head -1 | cut -d' ' -f2- | awk '{ print "74:ea:3a:"$1":"$2":"$3 }')
   if [ $? -eq 0 ]; then
      ifconfig $interface down
      ifconfig $interface hw ether $new_mac
      ifconfig $interface up
         if [ $? -eq 0 ]; then
            logger "MAC address successfully changed for $interface from $current_mac to $new_mac"
            current_mac=$(ifconfig ${interface} | grep "HWaddr" | awk '{print$5}')
	    logger "New MAC address: $current_mac"
            exit 0
         else
            logger "MAC address changing scriped failed"
            exit 1
         fi
   else
      logger "Failed to generate MAC address. Perhaps you are missing certain system utilities"
      exit 1
   fi
}

stop() {
   echo "Stopping MAC changer script.."
}
