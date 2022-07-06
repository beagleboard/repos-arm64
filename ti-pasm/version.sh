#!/bin/bash -e

#https://github.com/beagleboard/am335x_pru_package

package_name="ti-pasm"
debian_pkg_name="${package_name}"
package_version="0.87.20220706"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="t/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

clear_changelog="enable"

bullseye_version="~bullseye+20220706"
