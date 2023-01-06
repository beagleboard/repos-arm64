#!/bin/bash -e

#https://github.com/linuxmint/warpinator

package_name="warpinator"
debian_pkg_name="${package_name}"
package_version="1.4.3"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://github.com/linuxmint/warpinator"
git_sha="1773127d1f7fd5fca20610ed655df104e25177a4"
reprepro_dir="w/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""
local_patch="bbbio0"

bullseye_version="~bullseye+20230106"
