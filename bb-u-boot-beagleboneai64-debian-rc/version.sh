#!/bin/bash -e

#https://git.beagleboard.org/beagleboard/u-boot/
#https://github.com/u-boot/u-boot/commits/master

package_name="bb-u-boot-beagleboneai64-rc"
debian_pkg_name="${package_name}"
package_version="2024.04.20240129.1"
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

bullseye_version="~bullseye+20240130"
bookworm_version="~bookworm+20240130"