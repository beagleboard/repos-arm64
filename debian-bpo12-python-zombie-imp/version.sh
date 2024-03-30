#!/bin/bash -e

#https://packages.debian.org/source/trixie/python-zombie-imp

mirror="https://deb.debian.org/debian"

package_name="python-zombie-imp"
debian_pkg_name="${package_name}"
package_version="0.0.2"

git_repo=""
git_sha=""
reprepro_dir="p/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-2"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

dist="debian"
suite="bookworm"
deb_arch="arm64"
