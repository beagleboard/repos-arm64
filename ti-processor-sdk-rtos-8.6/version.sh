#!/bin/bash -e

package_name="ti-processor-sdk-rtos-8.6"
debian_pkg_name="${package_name}"
package_version="8.6.0.0"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="t/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

debian_dl_1="http://192.168.1.98/internal/dl/files/ti-processor-sdk-rtos-j721e-evm-08_06_00_12.tar.gz"
debian_dl_2="https://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/snapshot/opkg-utils-master.tar.gz"

clear_changelog="enable"

bullseye_version="~bullseye+20230413"
