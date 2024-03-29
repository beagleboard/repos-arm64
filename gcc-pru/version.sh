#!/bin/bash -e

package_name="gcc-pru"
debian_pkg_name="${package_name}"
package_version="13.2.0"
package_source=""
src_dir=""

newlib_version="4.2.0.20211231"

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
