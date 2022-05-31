#!/bin/bash -e

#https://packages.debian.org/source/bullseye-backports/cmake
mirror="https://deb.debian.org/debian"

package_name="debian-keyring"
debian_pkg_name="${package_name}"
package_version="2022.04.26"

git_repo=""
git_sha=""
reprepro_dir="d/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

dist="debian"
suite="bullseye"
deb_arch="arm64"
