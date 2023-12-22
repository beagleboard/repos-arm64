#!/bin/bash -e

#https://git.beagleboard.org/beagleboard/u-boot/
#https://github.com/u-boot/u-boot/commits/next

package_name="bb-u-boot-beagleboneai64-mainline"
debian_pkg_name="${package_name}"
package_version="2024.01.20231222.1"
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

bullseye_version="~bullseye+20231222"
bookworm_version="~bookworm+20231222"
trixie_version="~trixie+20231222"
jammy_version="~jammy+20231222"
noble_version="~noble+20231222"
