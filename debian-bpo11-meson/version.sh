#!/bin/bash -e

#https://snapshot.debian.org/package/meson/
#https://packages.debian.org/source/bookworm/llvm-toolchain-15
#mirror="https://deb.debian.org/debian"
mirror="https://snapshot.debian.org/archive/debian/20220323T210951Z"

package_name="meson"
debian_pkg_name="${package_name}"
package_version="0.62.0"

git_repo=""
git_sha=""
reprepro_dir="m/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"
debian_untar="${package_name}_${debian_version}.debian.tar.gz"
debian_patch=""

dist="debian"
suite="bullseye"
deb_arch="arm64"
