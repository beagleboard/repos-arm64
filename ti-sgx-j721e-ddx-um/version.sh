#!/bin/bash -e

#https://git.ti.com/gitweb?p=graphics/ti-img-rogue-umlibs.git;a=summary

package_name="ti-sgx-j721e-ddx-um"
debian_pkg_name="${package_name}"
package_version="1.15.6133109-k5.10-git20221011.0"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://git.ti.com/git/graphics/ti-img-rogue-umlibs.git"
git_sha="42e01fb5ef6971b344c1652986b1f589f77fecd9"
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

clear_changelog="enable"

bullseye_version="~bullseye+20220812"
