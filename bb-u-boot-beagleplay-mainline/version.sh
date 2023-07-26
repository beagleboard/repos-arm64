#!/bin/bash -e

#https://git.beagleboard.org/beagleboard/u-boot/

package_name="bb-u-boot-beagleplay-mainline"
debian_pkg_name="${package_name}"
package_version="2023.07.20230725.7"
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

bookworm_version="~bookworm+20230725"
trixie_version="~trixie+20230725"
jammy_version="~jammy+20230725"
