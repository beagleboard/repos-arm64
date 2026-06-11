#!/bin/bash

base="/var/www/html/repos/"
outgoing="/var/www/html/farm/outgoing"

run () {
	if [ ! -f ./camera-streamer-generic_0.4.2.trixie_arm64.deb ] ; then
		wget -c https://github.com/ayufan/camera-streamer/releases/download/v0.4.2/camera-streamer-generic_0.4.2.trixie_arm64.deb
	fi
	sync
	if [ -f ./camera-streamer-generic_0.4.2.trixie_arm64.deb ] ; then
		reprepro -b ${repo} -C main includedeb ${suite} ./camera-streamer-generic_0.4.2.trixie_arm64.deb
	fi
}

runner () {
	repo="${base}${dist}/"
	echo ${suite}
	run
}

start_run () {
	deb_arch="arm64"

	dist="debian-trixie-arm64"
	suite="trixie" ; runner
}

if [ ! -f /tmp/cron.lock ] ; then
	start_run
else
	echo "reprepro running"
fi
#
