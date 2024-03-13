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
}

copy_some () {
	cp -v ./src/${wfile} ./suite/bookworm/debian/
}

dl_src

wfile="arm32/usr/sbin/bb-wl18xx-select-fw" ; copy_some
wfile="arm32/usr/sbin/bb-wl18xx-bluetooth-hciattach" ; copy_all

#wfile="TIInit_11.8.32.bts" ; wdir="/debian/" ; copy_all
#wfile="wl18xx.conf" ; wdir="/debian/" ; copy_all
#wfile="wl18xx-conf.bin" ; wdir="/debian/" ; copy_all
#wfile="wl18xx-fw-4.bin" ; wdir="/debian/" ; copy_all

#wfile="TIInit_11.8.32.bts" ; wdir="/debian/" ; copy_some
#wfile="wl18xx.conf" ; wdir="/debian/" ; copy_some
#wfile="wl18xx-conf.bin" ; wdir="/debian/" ; copy_some
#wfile="wl18xx-fw-4.bin" ; wdir="/debian/" ; copy_some
