#!/bin/bash -e

#https://packages.debian.org/source/sid/libpwm

mirror="http://http.debian.net/debian"

package_name="libpwm"
debian_pkg_name="${package_name}"
package_version="1.0~rc2"
package_source="${debian_pkg_name}_${package_version}.orig.tar.xz"
#src_dir="${package_name}-${package_version}"
src_dir="${package_name}-1.0-rc2"

git_repo=""
git_sha=""
reprepro_dir="libp/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""
local_patch="bbbio0"

bookworm_version="~bookworm+20250731"
trixie_version="~trixie+20250731"
noble_version="~noble+20250731"
