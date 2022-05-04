#!/bin/bash -e

#https://github.com/coder/code-server/releases/tag/v4.3.0

package_name="bb-code-server"
debian_pkg_name="${package_name}"
package_version="4.3.0.0"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="b/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

#debian_dl_1="https://github.com/coder/code-server/releases/download/v4.3.0/code-server-4.3.0-linux-armv7l.tar.gz"
debian_dl_1="https://github.com/coder/code-server/releases/download/v4.3.0/code-server-4.3.0-linux-arm64.tar.gz"

clear_changelog="enable"

buster_version="~buster+20220504"
bullseye_version="~bullseye+20220504"
