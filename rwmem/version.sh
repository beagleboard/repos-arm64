#!/bin/bash -e

#https://github.com/tomba/rwmem

package_name="rwmem"
debian_pkg_name="${package_name}"
package_version="2.0-git20230127.0"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://github.com/tomba/rwmem"
git_sha="8f34a649f9af8a05a5f4dbdbd00800e10353a031"
reprepro_dir="r/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

clear_changelog="enable"

bullseye_version="~bullseye+20250304"
bookworm_version="~bookworm+20250304"
trixie_version="~trixie+20250304"
noble_version="~noble+20250304"
