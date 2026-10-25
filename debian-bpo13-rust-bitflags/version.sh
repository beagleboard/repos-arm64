#!/bin/bash -e

#https://snapshot.debian.org/package/rust-bitflags/
#https://snapshot.debian.org/archive/debian/20250730T204322Z/pool/main/r/rust-bitflags/rust-bitflags_2.9.1-1.dsc

#mirror="https://deb.debian.org/debian"
mirror="https://snapshot.debian.org/archive/debian/20250730T204322Z"

package_name="rust-bitflags"
debian_pkg_name="${package_name}"
package_version="2.9.1"

git_repo=""
git_sha=""
reprepro_dir="r/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

dist="debian-trixie-arm64"
suite="trixie"
deb_arch="arm64"
