#!/bin/bash -e

#https://snapshot.debian.org/package/spirv-llvm-translator-21/
#https://snapshot.debian.org/archive/debian/20250925T142947Z/pool/main/s/spirv-llvm-translator-21/spirv-llvm-translator-21_21.1.0-2.dsc
#https://packages.debian.org/source/forky/spirv-llvm-translator-21

#mirror="https://deb.debian.org/debian"
mirror="https://snapshot.debian.org/archive/debian/20250925T142947Z"

package_name="spirv-llvm-translator-21"
debian_pkg_name="${package_name}"
package_version="21.1.0"

git_repo=""
git_sha=""
reprepro_dir="s/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-2"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

dist="debian-trixie-arm64"
suite="trixie"
deb_arch="arm64"
