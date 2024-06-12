#!/bin/bash

dl_rpi () {
	if [ -d ./src/ ] ; then
		rm -rf ./src/
	fi
	echo "https://github.com/RPi-Distro/raspberrypi-sys-mods.git"
	git clone https://github.com/RPi-Distro/raspberrypi-sys-mods.git ./src/ --depth=1
}

dl_src () {
	if [ -d ./src/ ] ; then
		rm -rf ./src/
	fi
	echo "https://openbeagle.org/beagleboard/${repo}.git"
	git clone https://openbeagle.org/beagleboard/${repo}.git ./src/
}

copy_some () {
	cp -v ./src/${wfile} ./suite/bookworm/debian/
	cp -v ./src/${wfile} ./suite/trixie/debian/
	cp -v ./src/${wfile} ./suite/noble/debian/
}

copy_all () {
	cp -v ./src/${wfile} ./suite/bullseye/debian/
	cp -v ./src/${wfile} ./suite/bookworm/debian/
	cp -v ./src/${wfile} ./suite/jammy/debian/
	cp -v ./src/${wfile} ./suite/trixie/debian/
	cp -v ./src/${wfile} ./suite/noble/debian/
}

copy_debian () {
	cp -v ./src/${wfile} ./suite/bullseye/debian/
	cp -v ./src/${wfile} ./suite/bookworm/debian/
	cp -v ./src/${wfile} ./suite/trixie/debian/
}

copy_ubuntu () {
	cp -v ./src/${wfile} ./suite/jammy/debian/
	cp -v ./src/${wfile} ./suite/noble/debian/
}

dl_rpi

wfile="usr/lib/raspberrypi-sys-mods/imager_custom" ; copy_all

repo="raspi-config"
dl_src

wfile="LICENSE" ; copy_some
wfile="raspi-config" ; copy_some

#repo="usr-customizations"
#dl_src

#wfile="arm64/usr/sbin/beagle-kversion" ; copy_all

repo="bbbio-set-sysconf"
dl_src

wfile="src/bbbio-set-sysconf" ; copy_debian
wfile="src/iwd_migration.py" ; copy_all
wfile="src/sysconf.txt" ; copy_debian
wfile="src/ssid.psk" ; copy_debian
wfile="src/SoftAp0.conf" ; copy_debian

wfile="src/bbbio-set-sysconf" ; copy_ubuntu
wfile="src/sysconf.txt" ; copy_ubuntu
wfile="src/ssid.psk" ; copy_ubuntu
wfile="src/SoftAp0.conf" ; copy_ubuntu

repo="beagle-pin-mux"
dl_src

wfile="beagle-pin-mux" ; copy_all

repo="beagle-camera-setup"
dl_src

wfile="beagle-camera-setup" ; copy_all
