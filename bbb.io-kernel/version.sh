#!/bin/bash -e

package_name="bbb.io-kernel"
debian_pkg_name="${package_name}"
package_version="1.20241231.1"
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

bullseye_version="~bullseye+20241231"
bookworm_version="~bookworm+20241231"
trixie_version="~trixie+20241231"
jammy_version="~jammy+20241231"
noble_version="~noble+20241231"
