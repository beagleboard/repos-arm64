#!/bin/bash -e

#https://github.com/beagleboard/u-boot/commits/v2021.01-ti-08.00.00.004

package_name="bb-u-boot-beagleboneai64"
debian_pkg_name="${package_name}"
package_version="2021.10.20220113.0"
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

bullseye_version="~bullseye+20220113"
