#!/bin/bash -e

#https://git.ti.com/cgit/k3conf/k3conf/

package_name="ti-k3conf"
debian_pkg_name="${package_name}"
package_version="0.2.0-git20201222.0"
package_source="${package_name}-${package_version}.orig.tar.xz"
src_dir="${package_name}-${package_version}"

git_repo="https://git.ti.com/git/k3conf/k3conf.git"
git_sha="79f007cd462384ce22e750e9002b714878f56892"
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

bullseye_version="~bullseye+20210831"
