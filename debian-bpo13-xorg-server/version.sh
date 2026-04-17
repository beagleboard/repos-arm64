#!/bin/bash -e

#https://snapshot.debian.org/archive/debian/20250627T143139Z/pool/main/x/xorg-server/xorg-server_21.1.18-1.dsc
#https://snapshot.debian.org/archive/debian/20251029T211053Z/pool/main/x/xorg-server/xorg-server_21.1.20-1.dsc

#mirror="https://deb.debian.org/debian"
mirror="https://snapshot.debian.org/archive/debian/20251029T211053Z"

package_name="xorg-server"
debian_pkg_name="${package_name}"
epoch="2"
package_version="21.1.20"

git_repo=""
git_sha=""
reprepro_dir="x/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

dist="debian-trixie-arm64"
suite="trixie"
deb_arch="arm64"
