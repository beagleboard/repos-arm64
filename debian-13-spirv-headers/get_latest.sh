#!/bin/bash

version="main/s/spirv-headers/spirv-headers_1.6.1+1.4.341.0-1"

if [ -d ./dl/ ] ; then
	rm -rf ./dl/ || true
fi
mkdir ./dl/ || true
cd ./dl/
dget -u http://deb.debian.org/debian/pool/${version}.dsc
cd ../
