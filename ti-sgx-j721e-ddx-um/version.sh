#!/bin/bash -e

#https://git.ti.com/gitweb?p=graphics/ti-img-rogue-umlibs.git;a=summary

package_name="ti-sgx-j721e-ddx-um"
debian_pkg_name="${package_name}"
package_version="1.13.5776728-k5.10-git20210323.1"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="git://git.ti.com/graphics/ti-img-rogue-umlibs.git"
git_sha="5ef38353c38d921a65ea6df75c7b6ce710b66034"
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

bullseye_version="~bullseye+20211104"
