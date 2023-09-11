#!/bin/bash -e

#https://git.beagleboard.org/beagleboard/u-boot/

package_name="bb-u-boot-beagleplay-rc"
debian_pkg_name="${package_name}"
package_version="2023.10.20230909.0"
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

trixie_version="~trixie+20230909"
bullseye_version="~bullseye+20230910"
bookworm_version="~bookworm+20230910"
jammy_version="~jammy+20230910"
