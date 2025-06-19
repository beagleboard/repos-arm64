#!/bin/bash

dl_src () {
	if [ -d ./src/ ] ; then
		rm -rf ./src/
	fi

	git clone https://openbeagle.org/beagleboard/usr-customizations.git ./src/
}


copy_all () {
	cp -v ./src/${wfile} ./suite/bullseye/debian/
	cp -v ./src/${wfile} ./suite/bookworm/debian/
	cp -v ./src/${wfile} ./suite/trixie/debian/
	cp -v ./src/${wfile} ./suite/jammy/debian/
	cp -v ./src/${wfile} ./suite/noble/debian/
}

dl_src

wfile="arm64/etc/beagle-flasher/beagleplay-emmc-to-microsd" ; copy_all
wfile="arm64/etc/beagle-flasher/beagleplay-emmc-to-microsd-w-swap" ; copy_all
wfile="arm64/etc/beagle-flasher/beagleplay-microsd-to-emmc" ; copy_all
wfile="arm64/etc/beagle-flasher/beagleplay-microsd-to-emmc-w-swap" ; copy_all
