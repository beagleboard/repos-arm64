#!/bin/bash -e

#https://git.beagleboard.org/beagleboard/u-boot/
#https://git.ti.com/gitweb?p=ti-u-boot/ti-u-boot.git;a=shortlog;h=refs/heads/ti-u-boot-2023.04

package_name="bb-u-boot-j722s"
debian_pkg_name="${package_name}"
package_version="2023.04.2024013.0-09.02.00.002"
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

bookworm_version="~bookworm+20240131"
