#!/bin/bash -e

#https://packages.debian.org/source/trixie/cinnamon-settings-daemon

mirror="http://http.debian.net/debian"

package_name="cinnamon-settings-daemon"
debian_pkg_name="${package_name}"
package_version="6.0.0"
package_source="${debian_pkg_name}_${package_version}.orig.tar.gz"
src_dir="${package_name}-${package_version}"

git_repo=""
git_sha=""
reprepro_dir="c/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-2"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""
local_patch="bbbio0"

bookworm_version="~bookworm+20240507"
