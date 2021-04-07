#!/bin/bash -e

. version.sh

sudo mount -a

run () {
	wdir="/mnt/farm/incoming/${suite}/${debian_pkg_name}_${debian_version}/"
	if [ -d ${wdir} ] ; then
		rm -rf ${wdir}
	fi
	mkdir -p ${wdir} || true

	cp -v ${suite}/*.dsc ${wdir} || true
	cp -v ${suite}/*.gz ${wdir} || true
	cp -v ${suite}/*.bz2 ${wdir} || true
	cp -v ${suite}/*.xz ${wdir} || true
	echo "*******************************"
}

runner () {
	if [ -d ./suite/${suite}/ ] ; then
		run
	fi
}

start_run () {
	dist="debian"
	suite="bullseye" ; runner
}

start_run
#
