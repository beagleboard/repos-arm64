#!/bin/bash -e

#https://git.ti.com/gitweb?p=graphics/ti-img-rogue-umlibs.git;a=summary

package_name="ti-sgx-j721e-ddx-um"
debian_pkg_name="${package_name}"
package_version="1.15.6133109-k5.10-git20220510.2"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://git.ti.com/git/graphics/ti-img-rogue-umlibs.git"
git_sha="fba0c770b712640ab3761dbe8369d43f89f616ed"
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

clear_changelog="enable"

bullseye_version="~bullseye+20220708"
