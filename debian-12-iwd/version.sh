#!/bin/bash -e

#https://packages.debian.org/source/trixie/iwd

mirror="http://http.debian.net/debian"

package_name="iwd"
debian_pkg_name="${package_name}"
package_version="2.20"
package_source="${debian_pkg_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}-${package_version}"

git_repo=""
git_sha=""
reprepro_dir="i/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""
local_patch="bbbio0"

bookworm_version="~bookworm+20240903"
trixie_version="~trixie+20240903"
noble_version="~noble+20240903"
