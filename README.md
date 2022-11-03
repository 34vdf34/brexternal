# External tree for Buildroot

Use buildroot 2022.08.x

	git clone git://git.buildroot.net/buildroot
	cd buildroot
	git checkout 84b29a39416012e316da70dc0ad18b5887521422
	export BR2_EXTERNAL=[PATH]/brexternal
	make reterminal_64_usb_defconfig
	make 

## USB boot support

Modify package/rpi-firmware/cmdline.txt for USB boot support and reduce logging.

	root=/dev/sda2 rootwait console=tty1 console=ttyAMA0,115200 vt.global_cursor_default=0 logo.nologo quiet splash loglevel=2

