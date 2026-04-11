#!/bin/bash

build="18.10.1-1"

base="/var/www/html/repos/"
outgoing="/var/www/html/farm/outgoing"

run () {
	apt-get download gitlab-runner=${build} || true
	apt-get download gitlab-runner-helper-images=${build} || true
	ls
	#reprepro -b ${repo} -C main includedeb ${suite} ./gitlab*.deb
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
