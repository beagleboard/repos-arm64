#!/bin/bash -e

#https://git.ti.com/gitweb?p=rpmsg/ti-rpmsg-char.git;a=summary

package_name="ti-rpmsg-char"
debian_pkg_name="${package_name}"
package_version="0.5.2.20221220.0"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://git.ti.com/git/rpmsg/ti-rpmsg-char.git"
git_sha="1da3e1bd0412c148ab57690940fea5d129220896"
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

clear_changelog="enable"

bullseye_version="~bullseye+20230109"
