#!/bin/bash -e

#https://packages.debian.org/source/trixie/cython-legacy

mirror="https://deb.debian.org/debian"

package_name="cython-legacy"
debian_pkg_name="${package_name}"
package_version="0.29.37"

git_repo=""
git_sha=""
reprepro_dir="c/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

dist="debian"
suite="bookworm"
deb_arch="arm64"
