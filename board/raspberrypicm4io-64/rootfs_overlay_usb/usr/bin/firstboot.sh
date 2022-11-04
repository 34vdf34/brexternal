#!/bin/sh
if [ -e "/etc/fbc" ] 
then
    	echo "First boot is already done." 
else
	echo "Disabling systemd-networkd-wait-online.service"
	/bin/systemctl disable systemd-networkd-wait-online.service
	echo "Disabling proftpd service"
	/bin/systemctl disable proftpd.service
    	echo "This is first boot!"
    	cp /opt/tunnel/network-configurations/wg0.* /etc/systemd/network/
    	cp /opt/tunnel/service-files/* /etc/systemd/system/
    	touch /etc/fbc
    	sync
    	reboot --force
fi
exit 0
