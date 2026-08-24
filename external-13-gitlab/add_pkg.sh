#!/bin/bash

TARGET_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DAYS=14

base="/var/www/html/repos/"
outgoing="/var/www/html/farm/outgoing"

cleanup () {
	find "$TARGET_DIR" -name "*.deb" -type f -mtime +"$DAYS" -delete
}

run () {
	latest=$(apt-cache madison gitlab-runner | grep packages.gitlab.com | awk '{print $3}' | sort -V | tail -1)
	echo "latest: ${latest}"
	if [ ! -f ./gitlab-runner_${latest}_${deb_arch}.deb ] ; then
		apt-get download gitlab-runner:${deb_arch}=${latest} || true
	fi

	if [ ! -f ./gitlab-runner-helper-images_${latest}_all.deb ] ; then
		apt-get download gitlab-runner-helper-images=${latest} || true
	fi
	sync
	if [ -f ./gitlab-runner_${latest}_${deb_arch}.deb ] ; then
		if [ -f ./gitlab-runner-helper-images_${latest}_all.deb ] ; then
			reprepro -b ${repo} -C main includedeb ${suite} ./gitlab-runner_${latest}_${deb_arch}.deb
			reprepro -b ${repo} -C main includedeb ${suite} ./gitlab-runner-helper-images_${latest}_all.deb
		fi
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
