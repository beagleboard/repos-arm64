#!/bin/bash

TARGET_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DAYS=14

base="/var/www/html/repos/"
outgoing="/var/www/html/farm/outgoing"

cleanup () {
	find "$TARGET_DIR" -name "*.deb" -type f -mtime +"$DAYS" -delete
}

run () {
	latest=$(apt-cache madison firefox | grep packages.mozilla.org | awk '{print $3}' | sort -V | tail -1)
	echo "latest: ${latest}"
	if [ ! -f ./firefox_${latest}_${deb_arch}.deb ] ; then
		apt-get download firefox:${deb_arch}=${latest}
	fi
	sync
	if [ -f ./firefox_${latest}_${deb_arch}.deb ] ; then
		reprepro -b ${repo} -C main includedeb ${suite} ./firefox_${latest}_${deb_arch}.deb
	fi
}

runner () {
	repo="${base}${dist}/"
	echo ${suite}
	cleanup
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
