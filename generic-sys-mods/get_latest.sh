#!/bin/bash

dl_src () {
	if [ -d ./src/ ] ; then
		rm -rf ./src/
	fi

	git clone https://openbeagle.org/beagleboard/${repo}.git ./src/
}

copy_some () {
	cp -v ./src/${wfile} ./suite/bullseye/debian/
}

copy_all () {
	cp -v ./src/${wfile} ./suite/bookworm/debian/
	cp -v ./src/${wfile} ./suite/bullseye/debian/
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

repo="raspi-config"
dl_src

wfile="LICENSE" ; copy_some
wfile="raspi-config" ; copy_some

repo="usr-customizations"
dl_src

wfile="arm64/usr/sbin/beagle-kversion" ; copy_all


repo="bbbio-set-sysconf"
dl_src

wfile="src/debian/bbbio-set-sysconf" ; copy_debian
wfile="src/debian/sysconf.txt" ; copy_debian

wfile="src/ubuntu/bbbio-set-sysconf" ; copy_ubuntu
wfile="src/ubuntu/sysconf.txt" ; copy_ubuntu
