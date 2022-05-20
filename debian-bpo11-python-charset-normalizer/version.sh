#!/bin/bash -e

#https://packages.debian.org/source/sid/python-charset-normalizer
mirror="https://deb.debian.org/debian"

package_name="python-charset-normalizer"
debian_pkg_name="${package_name}"
package_version="2.0.6"

git_repo=""
git_sha=""
reprepro_dir="p/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-2"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

dist="debian"
suite="bullseye"
deb_arch="arm64"
