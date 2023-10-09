#!/bin/bash -e

#https://git.ti.com/cgit/k3conf/k3conf/

package_name="ti-k3conf"
debian_pkg_name="${package_name}"
package_version="0.3.0-0.git2023106.1"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://git.ti.com/git/k3conf/k3conf.git"
git_sha="de06befe878be061a40540d2127d4273320b35bc"
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

clear_changelog="enable"

bullseye_version="~bullseye+20231009"
bookworm_version="~bookworm+20231009"
trixie_version="~trixie+20231009"
jammy_version="~jammy+20231009"
