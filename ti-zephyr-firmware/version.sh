#!/bin/bash -e

#https://github.com/glneo/zephyr-firmware

package_name="ti-zephyr-firmware"
debian_pkg_name="${package_name}"
package_version="0.0.0-0.git20240606.0"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0bbbio0"
debian_patch=""
debian_diff=""

clear_changelog="enable"

bullseye_version="~bullseye+20240610"
bookworm_version="~bookworm+20240610"
trixie_version="~trixie+20240610"
jammy_version="~jammy+20240610"
noble_version="~noble+20240610"
