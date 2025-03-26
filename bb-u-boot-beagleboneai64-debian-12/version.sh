#!/bin/bash -e

#https://openbeagle.org/beagleboard/u-boot/
#https://github.com/u-boot/u-boot/commits/master

package_name="bb-u-boot-beagleboneai64"
debian_pkg_name="${package_name}"
package_version="2025.04.20250324.1"
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

bookworm_version="~bookworm+20250326"
trixie_version="~trixie+20250326"
jammy_version="~jammy+20250326"
noble_version="~noble+20250326"
