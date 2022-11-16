#!/bin/bash -e

#https://packages.debian.org/source/sid/wayland-protocols
#https://snapshot.debian.org/package/wayland-protocols/
#mirror="https://deb.debian.org/debian"
mirror="https://snapshot.debian.org/archive/debian/20220709T031205Z/"

package_name="wayland-protocols"
debian_pkg_name="${package_name}"
package_version="1.26"

git_repo=""
git_sha=""
reprepro_dir="w/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

dist="debian"
suite="bullseye"
deb_arch="arm64"
