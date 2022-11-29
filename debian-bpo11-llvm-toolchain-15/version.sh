#!/bin/bash -e

#https://snapshot.debian.org/package/llvm-toolchain-15/
#https://packages.debian.org/source/bookworm/llvm-toolchain-15
#mirror="https://deb.debian.org/debian"
mirror="https://snapshot.debian.org/archive/debian/20221029T093630Z"

package_name="llvm-toolchain-15"
debian_pkg_name="${package_name}"
package_version="15.0.3"

git_repo=""
git_sha=""
reprepro_dir="l/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-2"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

dist="debian"
suite="bullseye"
deb_arch="arm64"
