#!/bin/bash -e

#https://github.com/beagleboard/j721e-evm

package_name="ti-vision-apps-eaik-firmware"
debian_pkg_name="${package_name}"
package_version="1.20220418.0"
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

bullseye_version="~bullseye+20220418"
