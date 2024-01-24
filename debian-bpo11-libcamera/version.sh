#!/bin/bash -e

#https://packages.debian.org/source/bookworm/libcamera
mirror="https://deb.debian.org/debian"
mirror="https://snapshot.debian.org/archive/debian/20230616T215730Z"

package_name="libcamera"
debian_pkg_name="${package_name}"
package_version="0.0.5"

git_repo=""
git_sha=""
reprepro_dir="libc/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-2"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

dist="debian"
suite="bullseye"
deb_arch="arm64"
