#!/bin/bash -e

. version.sh

base="/var/www/html/rcn-ee.us/repos/"
outgoing="/var/www/html/farm/outgoing"

run () {
	changes_file=$(ls ${outgoing}/${suite}/${deb_arch}/${debian_pkg_name}_${debian_version}/ | grep changes | grep -v source)

	if [ ! "x${changes_file}" = "x" ] ; then
		if [ -f ${outgoing}/${suite}/${deb_arch}/${debian_pkg_name}_${debian_version}/${changes_file} ] ; then
			wfile="${outgoing}/${suite}/${deb_arch}/${debian_pkg_name}_${debian_version}/${changes_file}"
			reprepro -b ${repo} -C main include ${suite} ${wfile}
		fi
	fi
}

runner () {
	repo="${base}${dist}-arm64/"
	if [ -d ./suite/${suite}/ ] ; then
		run
	fi
}

start_run () {
	dist="debian"
	deb_arch="arm64"
	suite="bullseye" ; runner
	suite="bookworm" ; runner
	suite="trixie" ; runner
	suite="focal" ; runner
	suite="jammy" ; runner
}

start_run
#
