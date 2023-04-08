#!/bin/bash -e

#https://git.ti.com/gitweb?p=graphics/ti-img-rogue-umlibs.git;a=summary

package_name="ti-sgx-23.1-am62-ddx-um"
debian_pkg_name="${package_name}"
package_version="23.1.6404501-git20230405.1"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

clear_changelog="enable"

bullseye_version="~bullseye+20230407"
bookworm_version="~bookworm+20230407"
