#!/bin/bash -e

#https://git.ti.com/git/graphics/ti-img-rogue-driver.git

package_name="ti-img-rogue-driver"
debian_pkg_name="${package_name}"
package_version="26.1.6967606"
package_source="${debian_pkg_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://git.ti.com/git/graphics/ti-img-rogue-driver.git"
git_sha="50e14e425cbac240b2da93fac0cfcc987a4959c3"
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""
local_patch="bbbio0"

clear_changelog="enable"

trixie_version="~trixie+20261001"
