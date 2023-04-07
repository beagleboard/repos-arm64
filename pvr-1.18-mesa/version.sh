#!/bin/bash -e

#https://gitlab.freedesktop.org/StaticRocket/mesa/-/commits/powervr/kirkstone/22.0/
mirror="http://http.debian.net/debian"

package_name="mesa"
debian_pkg_name="${package_name}"
package_version="22.0.3-1.git20230125.0"
package_source="${debian_pkg_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://gitlab.freedesktop.org/StaticRocket/mesa"
git_sha="44b82a7b6fa8a86243911b1b0d6a07b0fd8ecfba"
reprepro_dir="m/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

bookworm_version="~bookworm+20230406"
