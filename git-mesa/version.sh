#!/bin/bash -e

#https://gitlab.freedesktop.org/mesa/mesa/-/commits/22.1/
mirror="http://http.debian.net/debian"

package_name="mesa"
debian_pkg_name="${package_name}"
package_version="22.1.1-0.git20220601.0"
package_source="${debian_pkg_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://gitlab.freedesktop.org/mesa/mesa"
git_sha="23bcaaeaaa7facc436e7b7e2f9dea92a6bf3c8c6"
reprepro_dir="m/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

bullseye_version="~bullseye+20220602"
