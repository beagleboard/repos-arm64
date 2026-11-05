#!/bin/bash -e

#https://github.com/TexasInstruments/mesa

package_name="ti-mesa-pvr"
debian_pkg_name="${package_name}"
package_version="25.2.8"
package_source="${debian_pkg_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://github.com/TexasInstruments/mesa"
git_sha="7b6e8de7b0acdaff684f1109c6acb575644a93ea"
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""
local_patch="bbbio0"

clear_changelog="enable"

trixie_version="~trixie+20261001"
