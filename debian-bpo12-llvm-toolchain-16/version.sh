#!/bin/bash -e

#https://packages.debian.org/source/bookworm/llvm-toolchain-16
#https://packages.debian.org/source/trixie/llvm-toolchain-16

mirror="https://deb.debian.org/debian"

package_name="llvm-toolchain-16"
debian_pkg_name="${package_name}"
package_version="16.0.6"

git_repo=""
git_sha=""
reprepro_dir="l/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-19"
#debian_version="${package_version}-15~deb12u1"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

dist="debian"
suite="bookworm"
deb_arch="arm64"
