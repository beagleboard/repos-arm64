#!/bin/bash -e

#https://tracker.debian.org/pkg/wpa
#https://packages.debian.org/source/trixie/ell

mirror="http://http.debian.net/debian"

package_name="ell"
debian_pkg_name="${package_name}"
package_version="0.66"
package_source="${debian_pkg_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}-${package_version}"

git_repo=""
git_sha=""
reprepro_dir="e/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""
local_patch="bbbio0"

bullseye_version="~bullseye+20240606"
bookworm_version="~bookworm+20240606"
jammy_version="~jammy+20240606"
noble_version="~noble+20240606"
