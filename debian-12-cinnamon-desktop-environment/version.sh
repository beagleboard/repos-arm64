#!/bin/bash -e

#https://packages.debian.org/source/trixie/cinnamon-desktop-environment

mirror="http://http.debian.net/debian"

package_name="cinnamon-desktop-environment"
debian_pkg_name="${package_name}"
package_version="5.8.0"
package_source="${debian_pkg_name}_${package_version}.tar.xz"
src_dir="${package_name}-${package_version}"

git_repo=""
git_sha=""
reprepro_dir="c/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}"
debian_untar=""
debian_patch=""
local_patch="bbbio0"

bookworm_version="~bookworm+20240507"
