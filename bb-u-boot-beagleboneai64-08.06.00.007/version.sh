#!/bin/bash -e

#https://git.beagleboard.org/beagleboard/u-boot/-/commits/v2021.01-ti-08.05.00.001

package_name="bb-u-boot-beagleboneai64-08.06.00.007"
debian_pkg_name="${package_name}"
package_version="2021.10.20230216.16"
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

bullseye_version="~bullseye+20230808"
bookworm_version="~bookworm+20230808"
