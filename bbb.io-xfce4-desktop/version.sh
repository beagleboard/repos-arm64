#!/bin/bash -e

package_name="bbb.io-xfce4-desktop"
debian_pkg_name="${package_name}"
package_version="1.20260417.0"
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

bookworm_version="~bookworm+20260417"
trixie_version="~trixie+20260417"
forky_version="~forky+20260417"
