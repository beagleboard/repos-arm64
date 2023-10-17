#!/bin/bash -e

#https://git.ti.com/gitweb?p=graphics/ti-img-rogue-umlibs.git;a=summary

package_name="powervr-firmware"
debian_pkg_name="${package_name}"
package_version="0.0.0-git20231003.0"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

clear_changelog="enable"

bullseye_version="~bullseye+20231017"
bookworm_version="~bookworm+20231017"
trixie_version="~trixie+20231017"
jammy_version="~jammy+20231017"
