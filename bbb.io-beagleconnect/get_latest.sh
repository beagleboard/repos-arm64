#!/bin/bash

version="beta0.0.3"

dl_src () {
	if [ -d ./firmware/ ] ; then
		rm -rf ./firmware/
	fi

	wget -c https://github.com/jadonk/beagleconnect/files/7479634/bcf-beta0.0.3-bcf-firmware-bin.zip
	unzip bcf-beta0.0.3-bcf-firmware-bin.zip -d ./firmware/

	if [ -d ./bridge/ ] ; then
		rm -rf ./bridge/
	fi

	wget -c https://github.com/jadonk/beagleconnect/files/7479633/bcf-beta0.0.3-usb-uart-bridge.zip
	unzip bcf-beta0.0.3-usb-uart-bridge.zip -d ./bridge/
}

copy_all () {
#	cp -v ./${wfile} ./suite/buster/debian/
	cp -fv ./${wfile} ./suite/bullseye/debian/
}

dl_src

wfile="firmware/greybus_mikrobus_beagleconnect.config" ; copy_all
wfile="firmware/wpanusb_beagleconnect.config" ; copy_all
wfile="firmware/sensortest_beagleconnect.bin" ; copy_all
wfile="firmware/wpanusb_beagleconnect.dts" ; copy_all
wfile="firmware/sensortest_beagleconnect.dts" ; copy_all
wfile="firmware/greybus_mikrobus_beagleconnect.dts" ; copy_all
wfile="firmware/sensortest_beagleconnect.config" ; copy_all
wfile="firmware/greybus_mikrobus_beagleconnect.bin" ; copy_all
wfile="firmware/wpanusb_beagleconnect.bin" ; copy_all

wfile="bridge/usb_uart_bridge_lp.hex" ; copy_all
wfile="bridge/usb_uart_bridge.hex" ; copy_all

echo "bcf-beta0.0.3" > ./suite/bullseye/debian/version
