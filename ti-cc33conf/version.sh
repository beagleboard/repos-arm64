#!/bin/bash -e

package_name="ti-cc33conf"
debian_pkg_name="${package_name}"
package_version="1.0.0.3"
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

bookworm_version="~bookworm+20240529"
