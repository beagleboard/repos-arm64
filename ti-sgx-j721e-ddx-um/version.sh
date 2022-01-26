#!/bin/bash -e

#https://git.ti.com/gitweb?p=graphics/ti-img-rogue-umlibs.git;a=summary

package_name="ti-sgx-j721e-ddx-um"
debian_pkg_name="${package_name}"
package_version="1.13.5776728-k5.10-git20220126.0"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="git://git.ti.com/graphics/ti-img-rogue-umlibs.git"
git_sha="258add91efa402d3647302165373c6a8d1b7201d"
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

clear_changelog="enable"

bullseye_version="~bullseye+20220126"
