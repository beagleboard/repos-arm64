#!/bin/bash -e

#https://packages.debian.org/source/trixie/iwd

mirror="http://http.debian.net/debian"

package_name="iwd"
debian_pkg_name="${package_name}"
package_version="2.18"
package_source="${debian_pkg_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}-${package_version}"

git_repo=""
git_sha=""
reprepro_dir="i/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""
local_patch="bbbio5"

bookworm_version="~bookworm+20240622"
trixie_version="~trixie+20240622"
noble_version="~noble+20240622"
