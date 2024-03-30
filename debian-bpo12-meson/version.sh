#!/bin/bash -e

#https://packages.debian.org/source/trixie/meson

#mirror="https://deb.debian.org/debian"
mirror="https://snapshot.debian.org/archive/debian/20240214T085951Z"

package_name="meson"
debian_pkg_name="${package_name}"
package_version="1.3.2"

git_repo=""
git_sha=""
reprepro_dir="m/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

dist="debian"
suite="bookworm"
deb_arch="arm64"
