#!/bin/bash

dl_src () {
	if [ -d ./src/ ] ; then
		rm -rf ./src/
	fi

	git clone https://openbeagle.org/beagleboard/usr-customizations.git ./src/
}

copy_some () {
	cp -v ./src/${wfile} ./suite/bookworm/debian/
	cp -v ./src/${wfile} ./suite/trixie/debian/
	cp -v ./src/${wfile} ./suite/noble/debian/
}

copy_all () {
	cp -v ./src/${wfile} ./suite/bullseye/debian/
	cp -v ./src/${wfile} ./suite/bookworm/debian/
	cp -v ./src/${wfile} ./suite/trixie/debian/
	cp -v ./src/${wfile} ./suite/jammy/debian/
	cp -v ./src/${wfile} ./suite/noble/debian/
}

dl_src

wfile="arm64/usr/sbin/beagle-flasher" ; copy_some
wfile="arm64/usr/sbin/beagle-flasher-boot-emmc-rootfs-nvme" ; copy_some
wfile="arm64/usr/sbin/beagle-flasher-boot-mmc-rootfs-sda" ; copy_some
wfile="arm64/usr/sbin/beagle-flasher-mv-rootfs-to-nvme" ; copy_some
wfile="arm64/usr/sbin/beagle-flasher-mv-rootfs-to-sda" ; copy_some
wfile="arm64/usr/sbin/enable-beagle-flasher" ; copy_some
wfile="arm64/usr/sbin/init-beagle-flasher" ; copy_some
wfile="arm64/usr/sbin/init-beagle-flasher-mv-rootfs-to-nvme" ; copy_some
wfile="arm64/etc/beagle-flasher/bbai64-emmc-to-microsd" ; copy_all
wfile="arm64/etc/beagle-flasher/bbai64-emmc-to-nvme" ; copy_all
wfile="arm64/etc/beagle-flasher/bbai64-microsd-to-emmc" ; copy_all
