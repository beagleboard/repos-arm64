#!/bin/bash -e

package_name="ti-processor-sdk-rtos"
debian_pkg_name="${package_name}"
package_version="8.1.0.13.0"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="t/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

debian_dl_1="https://dr-download.ti.com/software-development/software-development-kit-sdk/MD-bA0wfI4X2g/08.02.00.05/ti-processor-sdk-rtos-j721e-evm-08_01_00_13.tar.gz"
debian_dl_2="https://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/snapshot/opkg-utils-master.tar.gz"

clear_changelog="enable"

bullseye_version="~bullseye+20220513"
