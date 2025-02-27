#!/bin/bash -e

mirror="http://http.debian.net/debian"

package_name="firmware-nonfree"
debian_pkg_name="${package_name}"
package_version="20240709"
package_source="${debian_pkg_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}-${package_version}"

git_repo=""
git_sha=""
reprepro_dir="f/${package_name}"
dl_path="pool/non-free/${reprepro_dir}/"

debian_version="${package_version}-2~bpo12+1"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""
local_patch="bbbio0"

bookworm_version="~bookworm+20250227"
