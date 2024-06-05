#!/bin/bash -e

#https://packages.debian.org/source/sid/umtp-responder
mirror="http://http.debian.net/debian"

package_name="umtp-responder"
debian_pkg_name="${package_name}"
package_version="1.6.5-0bbbio0"
package_source="${debian_pkg_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://github.com/viveris/uMTP-Responder.git"
git_sha="299f25ea4def90dbbf3faf7f4a84f897028607c1"
reprepro_dir="u/${package_name}"
dl_path=""

debian_version="${package_version}"
debian_patch=""
debian_diff=""

clear_changelog="enable"

bullseye_version="~bullseye+20240605"
bookworm_version="~bookworm+20240605"
trixie_version="~trixie+20240605"
noble_version="~noble+20240605"
