#!/bin/bash -e

#https://git.ti.com/cgit/k3conf/k3conf/

package_name="ti-k3conf"
debian_pkg_name="${package_name}"
package_version="0.2.0-git20230719.0"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://git.ti.com/git/k3conf/k3conf.git"
git_sha="81581afb405085755aea7744c1d196533e8094c4"
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

clear_changelog="enable"

bullseye_version="~bullseye+20230728"
bookworm_version="~bookworm+20230728"
trixie_version="~trixie+20230728"
jammy_version="~jammy+20230728"
