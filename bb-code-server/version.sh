#!/bin/bash -e

#https://github.com/coder/code-server/releases

arch="arm64"
ver="4.95.3"

package_name="bb-code-server"
debian_pkg_name="${package_name}"
package_version="${ver}"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="b/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0bbbio0"
debian_untar=""
debian_patch=""

debian_dl_1="https://github.com/coder/code-server/releases/download/v${ver}/code-server-${ver}-linux-${arch}.tar.gz"

clear_changelog="enable"

bullseye_version="~bullseye+20241118"
bookworm_version="~bookworm+20241118"
trixie_version="~trixie+20241118"
jammy_version="~jammy+20241118"
noble_version="~noble+20241118"
