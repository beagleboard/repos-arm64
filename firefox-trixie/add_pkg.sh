#!/bin/bash

base="/var/www/html/repos/"
outgoing="/var/www/html/farm/outgoing"

run () {
	latest=$(apt-cache madison firefox | grep packages.mozilla.org | awk '{print $3}' | sort -V | tail -1)
	echo "latest: ${latest}"
	apt-get download firefox=${latest}
	sync
	if [ -f ./firefox_${latest}_${deb_arch}.deb ] ; then
		reprepro -b ${repo} -C main includedeb ${suite} ./firefox_${latest}_${deb_arch}.deb
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
