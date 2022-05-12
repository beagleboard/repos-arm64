#!/bin/bash -e

#https://www.ti.com/tool/download/C7000-CGT

package_name="ti-c7000-cgt-v2.1"
debian_pkg_name="${package_name}"
package_version="2.1.0"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="t/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

debian_dl_1="http://192.168.1.98/internal/dl/files/ti_cgt_c7000_2.1.0.LTS_armlinuxaarch64_busybox_installer.sh"

clear_changelog="enable"

bullseye_version="~bullseye+20220512"
