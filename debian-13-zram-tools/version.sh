#!/bin/bash -e

mirror="http://http.debian.net/debian"

package_name="zram-tools"
debian_pkg_name="${package_name}"
package_version="0.3.7"
package_source="${debian_pkg_name}_${package_version}.orig.tar.bz2"
src_dir="${package_name}-${package_version}"

git_repo=""
git_sha=""
reprepro_dir="z/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""
local_patch="bbbio0"

bookworm_version="~bookworm+20250923"
trixie_version="~trixie+20250923"
