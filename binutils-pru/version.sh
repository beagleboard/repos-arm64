#!/bin/bash -e

package_name="binutils-pru"
debian_pkg_name="${package_name}"
package_version="2.41"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="b/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""
local_patch="bbbio0"

bullseye_version="~bullseye+20230804"
bookworm_version="~bookworm+20230804"
