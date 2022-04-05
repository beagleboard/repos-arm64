#!/bin/bash -e

#https://git.ti.com/gitweb?p=rpmsg/ti-rpmsg-char.git;a=summary

package_name="ti-rpmsg-char"
debian_pkg_name="${package_name}"
package_version="0.4.1.20220222.1"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://git.ti.com/git/rpmsg/ti-rpmsg-char.git"
git_sha="355d2b0bcde5eb5c895a270d1835102d2bc39fbd"
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

clear_changelog="enable"

bullseye_version="~bullseye+20220405"
focal_version="~focal+20220405"
