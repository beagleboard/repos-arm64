#!/bin/bash -e

#https://git.beagleboard.org/beagleboard/u-boot/-/commits/v2021.01-ti-08.05.00.005-SDK-8.5/

package_name="bb-u-boot-beagleboneai64-sdk-8.5"
debian_pkg_name="${package_name}"
package_version="2021.10.20230109.1"
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

bullseye_version="~bullseye+20230109"
