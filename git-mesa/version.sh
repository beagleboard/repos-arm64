#!/bin/bash -e

#https://gitlab.freedesktop.org/mesa/mesa/-/commits/22.3/
mirror="http://http.debian.net/debian"

package_name="mesa"
debian_pkg_name="${package_name}"
package_version="22.3.5-1.git20230208.0"
package_source="${debian_pkg_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://gitlab.freedesktop.org/mesa/mesa"
git_sha="6570a15662e7b174080ef62335bb226eec84a6e8"
reprepro_dir="m/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

bullseye_version="~bullseye+20230404"
