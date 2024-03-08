#!/bin/bash

dl_src () {
	if [ -d ./src/ ] ; then
		rm -rf ./src/
	fi

	git clone https://openbeagle.org/beagleboard/usr-customizations.git ./src/
}


copy_all () {
	cp -v ./src/${wfile} ./suite/bullseye/debian/
}

dl_src

wfile="arm64/etc/beagle-flasher/bbai64-emmc-to-microsd" ; copy_all
wfile="arm64/etc/beagle-flasher/bbai64-emmc-to-nvme" ; copy_all
wfile="arm64/etc/beagle-flasher/bbai64-microsd-to-emmc" ; copy_all
