#!/bin/bash

dl_src () {
	if [ -d ./src/ ] ; then
		rm -rf ./src/
	fi

	git clone https://openbeagle.org/beagley-ai/beagley-ai.git ./src/ --depth=1
}

copy () {
	cp -v ./src/${wfile} ./suite/bullseye/debian/
	cp -v ./src/${wfile} ./suite/bookworm/debian/
	cp -v ./src/${wfile} ./suite/trixie/debian/
}

dl_src

wfile="firmware/cc33xx/cc33xx-conf.bin"       ; copy
wfile="firmware/cc33xx/cc33xx_2nd_loader.bin" ; copy
wfile="firmware/cc33xx/cc33xx_fw.bin"         ; copy
