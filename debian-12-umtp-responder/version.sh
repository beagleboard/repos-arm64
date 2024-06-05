#!/bin/bash -e

#https://packages.debian.org/source/sid/umtp-responder
mirror="http://http.debian.net/debian"

package_name="umtp-responder"
debian_pkg_name="${package_name}"
package_version="1.3.10-1bbbio1"
package_source="${debian_pkg_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://github.com/viveris/uMTP-Responder.git"
git_sha="52c38a4a756b30efecc6470b5e4d4f22f9187a45"
reprepro_dir="u/${package_name}"
dl_path=""

debian_version="${package_version}"
debian_patch=""
debian_diff=""

bookworm_version="~bookworm+20240605"
