#!/bin/bash

dl_src () {
	if [ -d ./src/ ] ; then
		rm -rf ./src/
	fi

	git clone https://openbeagle.org/beagleboard/usr-customizations.git ./src/
}

run_sed () {
	sed -i -e 's:bb-u-boot-beagleboneai64:bb-u-boot-beagleboneai64-mainline:g' ./src/${wfile}
}

copy_all () {
	cp -v ./src/${wfile} ./suite/bullseye/debian/
	cp -v ./src/${wfile} ./suite/bookworm/debian/
	cp -v ./src/${wfile} ./suite/trixie/debian/
	cp -v ./src/${wfile} ./suite/jammy/debian/
	cp -v ./src/${wfile} ./suite/noble/debian/
}

dl_src

wfile="arm64/etc/beagle-flasher/bbai64-emmc-to-microsd" ; run_sed ; copy_all
wfile="arm64/etc/beagle-flasher/bbai64-emmc-to-nvme" ; run_sed ; copy_all
wfile="arm64/etc/beagle-flasher/bbai64-microsd-to-emmc" ; run_sed ; copy_all
