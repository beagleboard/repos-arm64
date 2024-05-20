#!/bin/bash -e

package_name="bbb.io-cinnamon-desktop"
debian_pkg_name="${package_name}"
package_version="1.20240520.0"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="b/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

clear_changelog="enable"

bookworm_version="~bookworm+20240520"
