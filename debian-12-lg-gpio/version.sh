#!/bin/bash -e

mirror="http://archive.ubuntu.com/ubuntu"

package_name="lg-gpio"
debian_pkg_name="${package_name}"
package_version="0.2.0.0"
package_source="${debian_pkg_name}_${package_version}.orig.tar.xz"
#src_dir="${package_name}-${package_version}"
src_dir="lg"

git_repo=""
git_sha=""
reprepro_dir="l/${package_name}"
dl_path="pool/universe/${reprepro_dir}/"

debian_version="${package_version}-0ubuntu3"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""
local_patch="bbbio0"

bookworm_version="~bookworm+20240502"
