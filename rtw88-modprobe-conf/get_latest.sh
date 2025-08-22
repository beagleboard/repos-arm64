#!/bin/bash

dl_src () {
	if [ -d ./src/ ] ; then
		rm -rf ./src/
	fi

	git clone https://github.com/lwfinger/rtw88.git ./src/
}

copy_all () {
	cp -v ./src/${wfile} ./suite/bookworm/debian/
	cp -v ./src/${wfile} ./suite/trixie/debian/
	cp -v ./src/${wfile} ./suite/forky/debian/
}

dl_src

wfile="rtw88.conf" ; copy_all
