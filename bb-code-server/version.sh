#!/bin/bash -e

package_name="bb-code-server"
debian_pkg_name="${package_name}"
package_version="4.0.2.1"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="b/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

#debian_dl_1="https://github.com/cdr/code-server/releases/download/v4.0.1/code-server-4.0.1-linux-armv7l.tar.gz"
debian_dl_1="https://github.com/cdr/code-server/releases/download/v4.0.1/code-server-4.0.1-linux-arm64.tar.gz"

clear_changelog="enable"

buster_version="~buster+20211217"
bullseye_version="~bullseye+20220127"
