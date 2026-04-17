#!/bin/bash

#https://snapshot.debian.org/package/spirv-llvm-translator-21/
#https://snapshot.debian.org/archive/debian/20250925T142947Z/pool/main/s/spirv-llvm-translator-21/spirv-llvm-translator-21_21.1.0-2.dsc
#https://snapshot.debian.org/archive/debian/20250929T143752Z/pool/main/s/spirv-llvm-translator-21/spirv-llvm-translator-21_21.1.0-3.dsc
#https://snapshot.debian.org/archive/debian/20251013T025134Z/pool/main/s/spirv-llvm-translator-21/spirv-llvm-translator-21_21.1.1-1.dsc
#https://snapshot.debian.org/archive/debian/20251214T024003Z/pool/main/s/spirv-llvm-translator-21/spirv-llvm-translator-21_21.1.2-1.dsc
#https://snapshot.debian.org/archive/debian/20251228T023750Z/pool/main/s/spirv-llvm-translator-21/spirv-llvm-translator-21_21.1.3-1.dsc
#https://snapshot.debian.org/archive/debian/20260214T023651Z/pool/main/s/spirv-llvm-translator-21/spirv-llvm-translator-21_21.1.4-1.dsc
#https://packages.debian.org/source/forky/spirv-llvm-translator-21

version="20260214T023651Z/pool/main/s/spirv-llvm-translator-21/spirv-llvm-translator-21_21.1.4-1"

if [ -d ./dl/ ] ; then
	rm -rf ./dl/ || true
fi
mkdir ./dl/ || true
cd ./dl/
dget -u http://snapshot.debian.org/archive/debian/${version}.dsc
cd ../
