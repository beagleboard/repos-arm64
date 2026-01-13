#!/bin/bash -e

#https://github.com/coder/code-server/releases

arch="arm64"
ver="4.106.3"

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

bookworm_version="~bookworm+20260113"
trixie_version="~trixie+20260113"
forky_version="~forky+20260113"
noble_version="~noble+20260113"
