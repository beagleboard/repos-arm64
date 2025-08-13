#!/bin/bash -e

. version.sh

DIR="$PWD"

run () {
	wfile="${DIR}/suite/${suite}/debian/new"

	if [ "x${debian_version}" = "x" ] ; then
		if [ "x${epoch}" = "x" ] ; then
			echo "${debian_pkg_name} (${package_version}${local_patch}~${suite}+${simple_date}) ${suite}; urgency=low" > ${wfile}
		else
			echo "${debian_pkg_name} (${epoch}:${package_version}${local_patch}~${suite}+${simple_date}) ${suite}; urgency=low" > ${wfile}
		fi
	else
		if [ "x${epoch}" = "x" ] ; then
			echo "${debian_pkg_name} (${debian_version}${local_patch}~${suite}+${simple_date}) ${suite}; urgency=low" > ${wfile}
		else
			echo "${debian_pkg_name} (${epoch}:${debian_version}${local_patch}~${suite}+${simple_date}) ${suite}; urgency=low" > ${wfile}
		fi
	fi
	echo "" >> ${wfile}
	if [  -f ${DIR}/readme.log ] ; then
		cat ${DIR}/readme.log >> ${wfile}
	elif  [  -f ${DIR}/suite/${suite}/readme.log ] ; then
		cat ${DIR}/suite/${suite}/readme.log >> ${wfile}
	else
		echo "  * Rebuild ${debian_pkg_name}_${debian_version} for repos.rcn-ee.com" >> ${wfile}
	fi
	echo "" >> ${wfile}
	echo " -- Robert Nelson <robertcnelson@gmail.com>  ${new_date}" >> ${wfile}
	echo "" >> ${wfile}

	if [ "x${clear_changelog}" = "x" ] ; then
		cat ${DIR}/suite/${suite}/debian/changelog >> ${wfile}
	fi
	rm ${DIR}/suite/${suite}/debian/changelog
	mv ${wfile} ${DIR}/suite/${suite}/debian/changelog
}

new_date=`LANG=C date -R`
simple_date=`LANG=C date +%Y%m%d`

dist="debian"
suite="bookworm"
if [ -d ${DIR}/suite/${suite}/ ] ; then
	rcn_ee_version="${bookworm_version}"
	cat ${DIR}/version.sh | grep -v bookworm_version > ${DIR}/new-version.sh
	echo "${suite}_version=\"~${suite}+${simple_date}\"" >> ${DIR}/new-version.sh
	mv ${DIR}/new-version.sh ${DIR}/version.sh
	run
fi

dist="debian"
suite="trixie"
if [ -d ${DIR}/suite/${suite}/ ] ; then
	rcn_ee_version="${trixie_version}"
	cat ${DIR}/version.sh | grep -v trixie_version > ${DIR}/new-version.sh
	echo "${suite}_version=\"~${suite}+${simple_date}\"" >> ${DIR}/new-version.sh
	mv ${DIR}/new-version.sh ${DIR}/version.sh
	run
fi

dist="debian"
suite="forky"
if [ -d ${DIR}/suite/${suite}/ ] ; then
	rcn_ee_version="${forky_version}"
	cat ${DIR}/version.sh | grep -v forky_version > ${DIR}/new-version.sh
	echo "${suite}_version=\"~${suite}+${simple_date}\"" >> ${DIR}/new-version.sh
	mv ${DIR}/new-version.sh ${DIR}/version.sh
	run
fi

dist="debian"
suite="noble"
if [ -d ${DIR}/suite/${suite}/ ] ; then
	rcn_ee_version="${noble_version}"
	cat ${DIR}/version.sh | grep -v noble_version > ${DIR}/new-version.sh
	echo "${suite}_version=\"~${suite}+${simple_date}\"" >> ${DIR}/new-version.sh
	mv ${DIR}/new-version.sh ${DIR}/version.sh
	run
fi

#
