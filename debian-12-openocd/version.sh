#!/bin/bash -e

#https://packages.debian.org/source/sid/openocd
mirror="http://http.debian.net/debian"

package_name="openocd"
debian_pkg_name="${package_name}"
package_version="0.12.0-1bbbio8"
package_source="${debian_pkg_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://repo.or.cz/openocd.git"
git_sha="7f2d3e2925833c952ee73fb178c8fdee637c844e"
reprepro_dir="o/${package_name}"
dl_path=""

debian_version="${package_version}"
debian_patch=""
debian_diff=""

bullseye_version="~bullseye+20240717"
bookworm_version="~bookworm+20240717"
trixie_version="~trixie+20240717"
noble_version="~noble+20240717"
