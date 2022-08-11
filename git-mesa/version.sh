#!/bin/bash -e

#https://gitlab.freedesktop.org/mesa/mesa/-/commits/22.2/
mirror="http://http.debian.net/debian"

package_name="mesa"
debian_pkg_name="${package_name}"
package_version="22.2.0-1.git20220810.0"
package_source="${debian_pkg_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://gitlab.freedesktop.org/mesa/mesa"
git_sha="df035d289418fd53d39590d6e7ac4791090de3ed"
reprepro_dir="m/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

bullseye_version="~bullseye+20220811"
