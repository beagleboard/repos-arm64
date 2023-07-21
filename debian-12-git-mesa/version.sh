#!/bin/bash -e

#https://gitlab.freedesktop.org/mesa/mesa/-/commits/23.1/
mirror="http://http.debian.net/debian"

package_name="mesa"
debian_pkg_name="${package_name}"
package_version="23.1.4-1.git20230721.0"
package_source="${debian_pkg_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://gitlab.freedesktop.org/mesa/mesa"
git_sha="72a48f24cceabd8266e45d3f3df35173b17fdb4d"
reprepro_dir="m/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

bookworm_version="~bookworm+20230721"
