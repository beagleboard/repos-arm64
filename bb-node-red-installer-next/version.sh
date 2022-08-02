#!/bin/bash -e

package_name="bb-node-red-installer-next"
debian_pkg_name="${package_name}"
package_version="3.0.1.5"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="b/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

debian_dl_1="https://nodejs.org/dist/latest-v14.x/node-v14.20.0-linux-arm64.tar.xz"

clear_changelog="enable"

bullseye_version="~bullseye+20220802"
