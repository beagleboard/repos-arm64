#!/bin/bash -e

#https://packages.debian.org/source/bookworm/spirv-llvm-translator-15
mirror="https://deb.debian.org/debian"

package_name="spirv-llvm-translator-15"
debian_pkg_name="${package_name}"
package_version="15.0.0"
package_source="${debian_pkg_name}_${package_version}.orig.tar.gz"
src_dir="SPIRV-LLVM-Translator-${package_version}"

git_repo=""
git_sha=""
reprepro_dir="s/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""
local_patch="bbbio5"

bullseye_version="~bullseye+20221201"
