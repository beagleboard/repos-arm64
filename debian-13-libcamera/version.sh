#!/bin/bash -e

#https://packages.debian.org/source/trixie/libcamera

mirror="http://http.debian.net/debian"

package_name="libcamera"
debian_pkg_name="${package_name}"
package_version="0.7.0"
package_source="${debian_pkg_name}_${package_version}.orig.tar.gz"
#src_dir="${package_name}-v${package_version}"
src_dir="libcamera-v0.7.0-b7854fd07d42168f099b5ce30d1702e0e0875bf5"

git_repo=""
git_sha=""
reprepro_dir="libc/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""
local_patch="bbbio0"

trixie_version="~trixie+20260207"
