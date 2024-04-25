#!/bin/bash -e

#https://packages.debian.org/source/trixie/pycparser

mirror="https://deb.debian.org/debian"

package_name="pycparser"
debian_pkg_name="${package_name}"
package_version="2.22"
package_source="${debian_pkg_name}_${package_version}.orig.tar.gz"
src_dir="${package_name}-${package_version}"

git_repo=""
git_sha=""
reprepro_dir="p/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"
debian_untar=""
debian_patch="${package_name}_${debian_version}.debian.tar.xz"
local_patch="bbbio0"

bookworm_version="~bookworm+20240425"
