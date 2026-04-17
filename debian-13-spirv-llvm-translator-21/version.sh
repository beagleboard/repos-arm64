#!/bin/bash -e

#https://snapshot.debian.org/package/spirv-llvm-translator-21/
#https://snapshot.debian.org/archive/debian/20250925T142947Z/pool/main/s/spirv-llvm-translator-21/spirv-llvm-translator-21_21.1.0-2.dsc
#https://snapshot.debian.org/archive/debian/20250929T143752Z/pool/main/s/spirv-llvm-translator-21/spirv-llvm-translator-21_21.1.0-3.dsc
#https://snapshot.debian.org/archive/debian/20251013T025134Z/pool/main/s/spirv-llvm-translator-21/spirv-llvm-translator-21_21.1.1-1.dsc
#https://snapshot.debian.org/archive/debian/20251214T024003Z/pool/main/s/spirv-llvm-translator-21/spirv-llvm-translator-21_21.1.2-1.dsc
#https://snapshot.debian.org/archive/debian/20251228T023750Z/pool/main/s/spirv-llvm-translator-21/spirv-llvm-translator-21_21.1.3-1.dsc
#https://snapshot.debian.org/archive/debian/20260214T023651Z/pool/main/s/spirv-llvm-translator-21/spirv-llvm-translator-21_21.1.4-1.dsc
#https://packages.debian.org/source/forky/spirv-llvm-translator-21

#mirror="https://deb.debian.org/debian"
mirror="https://snapshot.debian.org/archive/debian/20260214T023651Z"

package_name="spirv-llvm-translator-21"
debian_pkg_name="${package_name}"
package_version="21.1.4"
package_source="${debian_pkg_name}_${package_version}.orig.tar.gz"
src_dir="SPIRV-LLVM-Translator-${package_version}"

git_repo=""
git_sha=""
reprepro_dir="s/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""
local_patch="bbbio0"

trixie_version="~trixie+20260416"
