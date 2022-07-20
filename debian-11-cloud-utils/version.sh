#!/bin/bash -e

#https://packages.debian.org/source/bookworm/cloud-utils

mirror="http://http.debian.net/debian"

package_name="cloud-utils"
debian_pkg_name="${package_name}"
package_version="0.33"
package_source="${debian_pkg_name}_${package_version}.orig.tar.gz"
src_dir="${package_name}-${package_version}"

git_repo=""
git_sha=""
reprepro_dir="c/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""
local_patch="bbbio0"

bullseye_version="~bullseye+20220720"
