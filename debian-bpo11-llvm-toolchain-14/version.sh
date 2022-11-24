#!/bin/bash -e

#https://snapshot.debian.org/package/llvm-toolchain-14/
#https://packages.debian.org/source/bookworm/llvm-toolchain-14
#mirror="https://deb.debian.org/debian"
mirror="https://snapshot.debian.org/archive/debian/20221023T211707Z"

package_name="llvm-toolchain-14"
debian_pkg_name="${package_name}"
package_version="14.0.6"

git_repo=""
git_sha=""
reprepro_dir="l/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-6"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

dist="debian"
suite="bullseye"
deb_arch="arm64"
