#!/bin/bash -e

package_name="bbb.io-xfce4-desktop"
debian_pkg_name="${package_name}"
package_version="1.20250814.1"
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

bookworm_version="~bookworm+20250814"
trixie_version="~trixie+20250814"
