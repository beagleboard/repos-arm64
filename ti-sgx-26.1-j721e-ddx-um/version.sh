#!/bin/bash -e

#https://git.ti.com/gitweb?p=graphics/ti-img-rogue-umlibs.git;a=summary

package_name="ti-sgx-26.1-j721e-ddx-um"
debian_pkg_name="${package_name}"
package_version="26.1.6967606.0"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""
local_patch="bbbio0"

clear_changelog="enable"

trixie_version="~trixie+20261001"
