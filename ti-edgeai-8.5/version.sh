#!/bin/bash -e

package_name="ti-edgeai-8.5"
debian_pkg_name="${package_name}"
package_version="8.5.0.0"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

clear_changelog="enable"

bullseye_version="~bullseye+20230417"
