#!/bin/bash -e

#https://packages.debian.org/source/trixie/spirv-llvm-translator-17
mirror="https://deb.debian.org/debian"

package_name="spirv-llvm-translator-17"
debian_pkg_name="${package_name}"
package_version="17.0.0"
package_source="${debian_pkg_name}_${package_version}.orig.tar.gz"
src_dir="SPIRV-LLVM-Translator-${package_version}"

git_repo=""
git_sha=""
reprepro_dir="s/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-3"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""
local_patch="bbbio3"

bookworm_version="~bookworm+20240124"
