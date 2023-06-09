#!/bin/bash -e

#https://gitlab.freedesktop.org/mesa/mesa/-/commits/23.1/
mirror="http://http.debian.net/debian"

package_name="mesa"
debian_pkg_name="${package_name}"
package_version="23.1.3-1.git20230622.0"
package_source="${debian_pkg_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://gitlab.freedesktop.org/mesa/mesa"
git_sha="1b830eb55e52748cff5c8c249e637accb7d603f6"
reprepro_dir="m/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

bookworm_version="~bookworm+20230626"
