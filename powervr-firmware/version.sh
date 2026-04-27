#!/bin/bash -e

#https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/log/powervr

package_name="powervr-firmware"
debian_pkg_name="${package_name}"
package_version="0.0.0-git20260402.0"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

clear_changelog="enable"

bookworm_version="~bookworm+20260427"
trixie_version="~trixie+20260427"
forky_version="~forky+20260427"
noble_version="~noble+20260427"
