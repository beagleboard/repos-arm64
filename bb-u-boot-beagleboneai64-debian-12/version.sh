#!/bin/bash -e

#https://openbeagle.org/beagleboard/u-boot/
#https://github.com/u-boot/u-boot/commits/master

package_name="bb-u-boot-beagleboneai64"
debian_pkg_name="${package_name}"
package_version="2025.10.20251006.3"
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

bookworm_version="~bookworm+20251125"
trixie_version="~trixie+20251125"
forky_version="~forky+20251125"
noble_version="~noble+20251125"
