#!/bin/bash -e

#https://www.ti.com/tool/download/C6000-CGT-8-3

package_name="ti-c6000-cgt-v8.3"
debian_pkg_name="${package_name}"
package_version="8.3.2"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="t/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

debian_dl_1="https://software-dl.ti.com/codegen/esd/cgt_public_sw/C6000/8.3.2/ti_cgt_c6000_8.3.2_armlinuxa8hf_busybox_installer.sh"

bullseye_version="~bullseye+20210809"
