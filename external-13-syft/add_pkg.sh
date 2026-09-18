#!/bin/bash

base="/var/www/html/repos/"
outgoing="/var/www/html/farm/outgoing"

version=1.52.0

grab () {
	if [ ! -f ./syft_{version}_linux_${deb_arch}.deb ] ; then
		rm -rf ./*.deb || true
		rm -rf ./s*
		wget -c https://github.com/anchore/syft/releases/download/v${version}/syft_${version}_linux_${deb_arch}.deb
	fi
}

run () {
	reprepro --section misc -b ${repo} -C main includedeb ${suite} ./syft_${version}_linux_${deb_arch}.deb
}

runner () {
	grab
	repo="${base}${dist}/"
	echo ${suite}
	run
}

start_run () {
	dist="debian-arm64"
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
