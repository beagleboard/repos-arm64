#!/bin/bash -e

#https://packages.debian.org/source/sid/distrobox

mirror="http://http.debian.net/debian"

package_name="distrobox"
debian_pkg_name="${package_name}"
package_version="1.3.1"
package_source="${debian_pkg_name}_${package_version}.orig.tar.gz"
src_dir="${package_name}-${package_version}"

git_repo=""
git_sha=""
reprepro_dir="c/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-2"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""
local_patch="bbbio0"

bullseye_version="~bullseye+20220914"
