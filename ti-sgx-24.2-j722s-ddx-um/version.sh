#!/bin/bash -e

#https://git.ti.com/gitweb?p=graphics/ti-img-rogue-umlibs.git;a=summary

package_name="ti-sgx-24.2-j722s-ddx-um"
debian_pkg_name="${package_name}"
package_version="24.2.6643903.0"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""
local_patch="bbbio2"

clear_changelog="enable"

bookworm_version="~bookworm+20250506"
