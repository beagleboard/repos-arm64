#!/bin/bash

debian_pool="http://192.168.1.10/debian/pool"

generic_http () {
	echo "Checking: ${package_name}"
	if [ -f /tmp/index.html ] ; then
		rm -f /tmp/index.html
	fi
	wget --no-verbose --directory-prefix=/tmp/ ${site}/${package_name}/ &> /dev/null
	cat /tmp/index.html | grep "<a href=" > /tmp/temp.html
	sed -i -e "s/<a href/\\n<a href/g" /tmp/temp.html
	sed -i -e 's/\"/\"><\/a>\n/2' /tmp/temp.html
	cat /tmp/temp.html | grep href | grep dsc > /tmp/index.html
	sed -i -e 's/<a href="//g' /tmp/index.html
	sed -i -e 's/"><\/a>//g' /tmp/index.html
}

generic_http_tar () {
	echo "Checking: ${package_name}"
	if [ -f /tmp/index.html ] ; then
		rm -f /tmp/index.html
	fi
	wget --no-verbose --directory-prefix=/tmp/ ${site}/${package_name}/ &> /dev/null
	cat /tmp/index.html | grep "<a href=" > /tmp/temp.html
	sed -i -e "s/<a href/\\n<a href/g" /tmp/temp.html
	sed -i -e 's/\"/\"><\/a>\n/2' /tmp/temp.html
	cat /tmp/temp.html | grep tar | grep tar > /tmp/index.html
	sed -i -e 's/<a href="//g' /tmp/index.html
	sed -i -e 's/"><\/a>//g' /tmp/index.html
	sed -i -e 's/>//g' /tmp/index.html
}

generic_check () {
	if [ ! "x${version}" = "x" ] ; then
		if [ ! "x${package_version}" = "x${version}" ] ; then
			echo "PACKAGE UPDATE: ${package_name}: debian-repo:${version} bb.org-repo:${package_version}"
			echo ""
		fi
	else
		echo "Fail: [${site}/${package_name}/]"
		echo ""
	fi
}

check_http_tar () {
	generic_http_tar
	version=$(cat /tmp/index.html | grep tar | tail -n 1 | awk -F ".tar.gz" '{print $1}')
	generic_check
}

check_http_exp () {
	generic_http
	version=$(cat /tmp/index.html | grep -v bpo | grep dsc | tail -n 1 | awk -F ".dsc" '{print $1}')
	generic_check
}

check_http () {
	generic_http
	if [ "x${filter}" = "x" ] ; then
		if [ "x${ignore}" = "x" ] ; then
			version=$(cat /tmp/index.html | grep -v '~deb' | grep -v exp | grep -v bpo | grep dsc | tail -n 1 | awk -F ".dsc" '{print $1}')
		else
			version=$(cat /tmp/index.html | grep -v ${ignore} | grep -v '~deb' | grep -v exp | grep -v bpo | grep dsc | tail -n 1 | awk -F ".dsc" '{print $1}')
			unset ignore
		fi
	else
		if [ "x${ignore}" = "x" ] ; then
			version=$(cat /tmp/index.html | grep ${filter} | grep -v exp | grep -v bpo | grep dsc | tail -n 1 | awk -F ".dsc" '{print $1}')
		else
			version=$(cat /tmp/index.html | grep -v ${ignore} | grep ${filter} | grep -v exp | grep -v bpo | grep dsc | tail -n 1 | awk -F ".dsc" '{print $1}')
			unset ignore
		fi
		unset filter
	fi
	generic_check
}

check_http_machine () {
	generic_http
	version=$(cat /tmp/index.html | grep jessie | grep dsc | tail -n 1 | awk -F ".dsc" '{print $1}')
	generic_check
}

check () {
	echo "Checking: ${package_name}"
	output=$(rmadison -s ${suite} ${package_name} | grep ${package_name})
	version=$(echo ${output} | awk '{print $3}')
	if [ ! "x${version}" = "x" ] ; then
		if [ ! "x${package_version}" = "x${version}" ] ; then
			echo "Change: ${package_name}: ${suite}:${version} local:${package_version}"
			echo ""
		fi
	else
		echo ${output}
	fi
}

cinnamon () {
	site="${debian_pool}/main/x"
	package_name="xapp" ; package_version="${package_name}_2.8.2-1" ; check_http

	site="${debian_pool}/main/x"
	package_name="xdg-desktop-portal-xapp" ; package_version="${package_name}_1.0.4-1" ; check_http

	site="${debian_pool}/main/c"
	package_name="cinnamon-translations" ; package_version="${package_name}_6.0.2-2" ; check_http
	package_name="cinnamon-desktop" ; package_version="${package_name}_6.0.0-2" ; check_http
	package_name="cinnamon-menus" ; package_version="${package_name}_6.0.0-1" ; check_http
	package_name="cinnamon-session" ; package_version="${package_name}_6.0.4-2" ; check_http
	package_name="cinnamon-settings-daemon" ; package_version="${package_name}_6.0.0-2" ; check_http
	package_name="cinnamon-screensaver" ; package_version="${package_name}_6.0.3-2" ; check_http
	package_name="cjs" ; package_version="${package_name}_6.0.0-2" ; check_http
	package_name="cinnamon-control-center" ; package_version="${package_name}_6.0.1-3" ; check_http

	site="${debian_pool}/main/m"
	package_name="muffin" ; package_version="${package_name}_6.0.1-3" ; check_http

	site="${debian_pool}/main/c"
	package_name="cinnamon" ; package_version="${package_name}_6.0.4-4" ; check_http

	site="${debian_pool}/main/n"
	package_name="nemo" ; package_version="${package_name}_6.0.2-2" ; check_http
	package_name="nemo-fileroller" ; package_version="${package_name}_6.0.0+ds-1" ; check_http
	package_name="nemo-python" ; package_version="${package_name}_6.0.0+ds-1" ; check_http

	site="${debian_pool}/main/c"
	package_name="cinnamon-desktop-environment" ; package_version="${package_name}_5.8.0" ; check_http
}

cinnamon

echo "Done:"
#