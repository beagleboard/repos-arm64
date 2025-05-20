#!/bin/bash -e

#https://openbeagle.org/beagleboard/u-boot/
#https://github.com/u-boot/u-boot/commits/master

package_name="bb-u-boot-beagley-ai"
debian_pkg_name="${package_name}"
package_version="2023.04.20240319.31-09.02.00.009"
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

bullseye_version="~bullseye+20250520"
bookworm_version="~bookworm+20250520"
trixie_version="~trixie+20250520"
noble_version="~noble+20250520"
