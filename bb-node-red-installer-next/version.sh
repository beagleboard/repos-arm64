#!/bin/bash -e

#https://www.npmjs.com/package/node-red

package_name="bb-node-red-installer-next"
debian_pkg_name="${package_name}"
package_version="3.1.10.1"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="b/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

debian_dl_1="https://nodejs.org/dist/latest-v18.x/node-v18.20.3-linux-arm64.tar.xz"

clear_changelog="enable"

bookworm_version="~bookworm+20240621"
