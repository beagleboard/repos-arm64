#!/bin/bash -e

#https://github.com/rcn-ee/devmem2

package_name="ti-devmem2"
debian_pkg_name="${package_name}"
package_version="0.0.0-git20210904.2"
package_source="${package_name}-${package_version}.orig.tar.xz"
src_dir="${package_name}-${package_version}"

git_repo="https://github.com/rcn-ee/devmem2"
git_sha="470319937138048f25650614f59e76653877309c"
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

bullseye_version="~bullseye+20210904"
