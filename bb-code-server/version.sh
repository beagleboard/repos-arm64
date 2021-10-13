#!/bin/bash -e

package_name="bb-code-server"
debian_pkg_name="${package_name}"
package_version="3.12.0.2"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="b/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

#debian_dl_1="https://github.com/cdr/code-server/releases/download/v3.12.0/code-server-3.12.0-linux-armv7l.tar.gz"
debian_dl_1="https://github.com/cdr/code-server/releases/download/v3.12.0/code-server-3.12.0-linux-arm64.tar.gz"

bullseye_version="~bullseye+20211013"
