#!/bin/sh
if [ -e "/etc/fbc" ] 
then
    echo "First boot is already done" 
else
    echo "This is first boot!"
    cp /opt/tunnel/network-configurations/wg0.* /etc/systemd/network/
    cp /opt/tunnel/service-files/* /etc/systemd/system/
    touch /etc/fbc
    sync
    reboot --force
fi
exit 0
