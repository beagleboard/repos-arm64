#!/bin/bash -e

#https://github.com/beagleboard/arm-trusted-firmware

package_name="bb-arm-trusted-firmware-k3-generic-opteed"
debian_pkg_name="${package_name}"
package_version="2.5.20211014.0"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="b/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

bullseye_version="~bullseye+20211015"
