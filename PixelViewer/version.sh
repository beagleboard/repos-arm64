#!/bin/bash -e

package_name="pixelviewer"
debian_pkg_name="${package_name}"
package_version="3.0.5.214"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="p/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""
local_patch="bbbio0"

clear_changelog="enable"

bookworm_version="~bookworm+20240529"
