#!/bin/bash -e

#https://openbeagle.org/beagleboard/u-boot/
#https://github.com/u-boot/u-boot/commits/master

package_name="bb-u-boot-pocketbeagle2"
debian_pkg_name="${package_name}"
package_version="2025.10.20251006.9"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="b/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

clear_changelog="enable"

bookworm_version="~bookworm+20260120"
trixie_version="~trixie+20260120"
forky_version="~forky+20260120"
noble_version="~noble+20260120"
