#!/bin/bash -e

#https://github.com/u-boot/u-boot/commits/master

package_name="bb-u-boot-j721e-evm"
debian_pkg_name="${package_name}"
package_version="2021.07.20210720.11"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="b/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

debian_dl_1="https://github.com/beagleboard/j721e-evm/raw/main/bootloader/deploy/2021-07-21/sysfw.itb"
debian_dl_2="https://github.com/beagleboard/j721e-evm/raw/main/bootloader/deploy/2021-07-21/bl31.bin"
debian_dl_3="https://github.com/beagleboard/j721e-evm/raw/main/bootloader/deploy/2021-07-21/tee-pager_v2.bin"

bullseye_version="~bullseye+20210721"
