#!/bin/bash

version="main/c/ccache/ccache_4.13.2-1"

if [ -d ./dl/ ] ; then
	rm -rf ./dl/ || true
fi
mkdir ./dl/ || true
cd ./dl/
dget -u http://deb.debian.org/debian/pool/${version}.dsc
cd ../
