#!/bin/bash -e

#https://gitlab.freedesktop.org/mesa/mesa/-/commits/23.3/
mirror="http://http.debian.net/debian"

package_name="mesa"
debian_pkg_name="${package_name}"
package_version="23.3.2"
package_source="${debian_pkg_name}_${package_version}.orig.tar.gz"
src_dir="${package_name}-${package_version}"

git_repo=""
git_sha=""
reprepro_dir="m/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-2"
debian_untar=""
debian_patch="${package_name}_${debian_version}.diff.gz"
local_patch="bbbio0"

bookworm_version="~bookworm+20240105"
