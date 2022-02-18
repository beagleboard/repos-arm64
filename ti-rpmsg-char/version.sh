#!/bin/bash -e

#https://git.ti.com/gitweb?p=rpmsg/ti-rpmsg-char.git;a=summary

package_name="ti-rpmsg-char"
debian_pkg_name="${package_name}"
package_version="0.4.0.20220201.0"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://git.ti.com/git/rpmsg/ti-rpmsg-char.git"
git_sha="92b464f1e7477f77e44ae18d87b3d369576d662e"
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

clear_changelog="enable"

bullseye_version="~bullseye+20220218"
