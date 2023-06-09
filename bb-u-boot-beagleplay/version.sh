#!/bin/bash -e

#https://git.beagleboard.org/beagleboard/u-boot/

package_name="bb-u-boot-beagleplay"
debian_pkg_name="${package_name}"
package_version="2021.01.20230213.12"
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

bullseye_version="~bullseye+20230707"
bookworm_version="~bookworm+20230707"
trixie_version="~trixie+20230707"
jammy_version="~jammy+20230707"
