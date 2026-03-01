#!/bin/bash

version="main/d/directx-headers/directx-headers_1.619.0-1"

if [ -d ./dl/ ] ; then
	rm -rf ./dl/ || true
fi
mkdir ./dl/ || true
cd ./dl/
dget -u http://deb.debian.org/debian/pool/${version}.dsc
cd ../
