#!/bin/bash -e

#https://openbeagle.org/beagleboard/u-boot/
#https://github.com/u-boot/u-boot/commits/master

package_name="bb-u-boot-beagleplay-mainline"
debian_pkg_name="${package_name}"
package_version="2024.10.20241114.0"
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

bullseye_version="~bullseye+20241114"
bookworm_version="~bookworm+20241114"
trixie_version="~trixie+20241114"
jammy_version="~jammy+20241114"
noble_version="~noble+20241114"
