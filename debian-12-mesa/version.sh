#!/bin/bash -e

#https://gitlab.freedesktop.org/mesa/mesa/-/commits/24.1/
mirror="http://http.debian.net/debian"

package_name="mesa"
debian_pkg_name="${package_name}"
package_version="25.0.0"
package_source="${debian_pkg_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}-${package_version}"
#src_dir="mesa-24.1.0-rc3"

git_repo=""
git_sha=""
reprepro_dir="m/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""
local_patch="bbbio0"

bookworm_version="~bookworm+20250227"
