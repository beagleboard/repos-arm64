#!/bin/bash -e

package_name="ti-processor-sdk-rtos-8.1"
debian_pkg_name="${package_name}"
package_version="8.1.0.0"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="t/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

debian_dl_1="http://192.168.1.98/internal/dl/files/ti-processor-sdk-rtos-j721e-evm-08_01_00_13.tar.gz"
debian_dl_2="http://192.168.1.98/internal/dl/files/opkg-utils-master.tar.gz"

clear_changelog="enable"

bullseye_version="~bullseye+20220607"
