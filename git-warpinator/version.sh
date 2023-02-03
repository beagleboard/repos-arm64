#!/bin/bash -e

#https://github.com/linuxmint/warpinator

package_name="warpinator"
debian_pkg_name="${package_name}"
package_version="1.4.4"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://github.com/linuxmint/warpinator"
git_sha="34b18a19e4208da517668bf11f09c9e562f6ccc3"
reprepro_dir="w/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""
local_patch="bbbio0"

bullseye_version="~bullseye+20230202"
