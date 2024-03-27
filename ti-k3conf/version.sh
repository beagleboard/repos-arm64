#!/bin/bash -e

#https://git.ti.com/cgit/k3conf/k3conf/

package_name="ti-k3conf"
debian_pkg_name="${package_name}"
package_version="0.3.0-0.git20240306.0"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://git.ti.com/git/k3conf/k3conf.git"
git_sha="85a7433202aafafbccea8a7b2491f4df8b1ecd80"
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

clear_changelog="enable"

bullseye_version="~bullseye+20240327"
bookworm_version="~bookworm+20240327"
trixie_version="~trixie+20240327"
jammy_version="~jammy+20240327"
