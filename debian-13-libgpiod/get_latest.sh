#!/bin/bash

version="main/libg/libgpiod/libgpiod_2.2.3-1"

if [ -d ./dl/ ] ; then
	rm -rf ./dl/ || true
fi
mkdir ./dl/ || true
cd ./dl/
dget -u http://deb.debian.org/debian/pool/${version}.dsc
cd ../
