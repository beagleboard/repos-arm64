#!/bin/bash -e

#https://snapshot.debian.org/package/llvm-toolchain-21/
#https://snapshot.debian.org/archive/debian/20250926T083837Z/pool/main/l/llvm-toolchain-21/llvm-toolchain-21_21.1.2-2.dsc
#https://packages.debian.org/source/forky/llvm-toolchain-21

#mirror="https://deb.debian.org/debian"
mirror="https://snapshot.debian.org/archive/debian/20250926T083837Z"

package_name="llvm-toolchain-21"
debian_pkg_name="${package_name}"
package_version="21.1.2"

git_repo=""
git_sha=""
reprepro_dir="l/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-2"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

dist="debian-trixie-arm64"
suite="trixie"
deb_arch="arm64"
