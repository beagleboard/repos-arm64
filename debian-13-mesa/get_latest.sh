#!/bin/bash

version="26.0.1-2"

if [ -d ./dl/ ] ; then
	rm -rf ./dl/ || true
fi
mkdir ./dl/ || true
cd ./dl/
dget -u http://deb.debian.org/debian/pool/main/m/mesa/mesa_${version}.dsc
cd ../
