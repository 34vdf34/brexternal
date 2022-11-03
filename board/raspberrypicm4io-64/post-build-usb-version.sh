#!/bin/sh

set -u
set -e

# Add a console on tty1
if [ -e ${TARGET_DIR}/etc/inittab ]; then
    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
	sed -i '/GENERIC_SERIAL/a\
tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
fi

# Create dir /boot/
if [ ! -d "${TARGET_DIR}/boot/" ]; then
	mkdir ${TARGET_DIR}/boot/
fi

#
# Modify the /etc/fstab
#
# Internal boot vs USB boot block device naming
#
FSTAB_PATH=${TARGET_DIR}/etc/fstab

# USB boot:
echo "/dev/root / auto rw 0 1" > $FSTAB_PATH
echo "/dev/sda1          /boot           vfat    defaults        0       0" >> $FSTAB_PATH
echo "/dev/sda3 /mnt auto rw,defaults,x-systemd.automount,x-systemd.device-timeout=5,noatime,noauto 0 2" >> $FSTAB_PATH

# Modify the /etc/profile
PROFILE_PATH=${TARGET_DIR}/etc/profile
grep -q "^export PS1=" $PROFILE_PATH || echo "export PS1='\u@\h:\w\\$ '" >> $PROFILE_PATH
