#!/bin/bash -e

#https://snapshot.debian.org/package/llvm-toolchain-17/
#https://snapshot.debian.org/archive/debian/20231101T091841Z/pool/main/l/llvm-toolchain-17/llvm-toolchain-17_17.0.4-1.dsc
#https://snapshot.debian.org/archive/debian/20231114T150217Z/pool/main/l/llvm-toolchain-17/llvm-toolchain-17_17.0.5-1.dsc
#https://snapshot.debian.org/archive/debian/20231130T032551Z/pool/main/l/llvm-toolchain-17/llvm-toolchain-17_17.0.6-1.dsc
#https://packages.debian.org/source/trixie/llvm-toolchain-17

mirror="https://deb.debian.org/debian"
#mirror="https://snapshot.debian.org/archive/debian/20231130T032551Z"

package_name="llvm-toolchain-17"
debian_pkg_name="${package_name}"
package_version="17.0.6"

git_repo=""
git_sha=""
reprepro_dir="l/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-5"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

dist="debian"
suite="bookworm"
deb_arch="arm64"
