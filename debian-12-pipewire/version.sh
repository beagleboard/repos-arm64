#!/bin/bash -e

#https://packages.debian.org/source/stable/libcamera

mirror="http://http.debian.net/debian"

package_name="pipewire"
debian_pkg_name="${package_name}"
package_version="1.0.5"
package_source="${debian_pkg_name}_${package_version}.orig.tar.bz2"
src_dir="${package_name}-${package_version}"

git_repo=""
git_sha=""
reprepro_dir="p/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1~bpo12+1"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""
local_patch="bbbio0"

bookworm_version="~bookworm+20240529"
