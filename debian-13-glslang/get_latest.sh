#!/bin/bash

version="main/g/glslang/glslang_16.2.0-2"

if [ -d ./dl/ ] ; then
	rm -rf ./dl/ || true
fi
mkdir ./dl/ || true
cd ./dl/
dget -u http://deb.debian.org/debian/pool/${version}.dsc
cd ../
