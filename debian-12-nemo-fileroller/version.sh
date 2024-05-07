#!/bin/bash -e

#https://packages.debian.org/source/trixie/nemo-fileroller

mirror="http://http.debian.net/debian"

package_name="nemo-fileroller"
debian_pkg_name="${package_name}"
package_version="6.0.0+ds"
package_source="${debian_pkg_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}"

git_repo=""
git_sha=""
reprepro_dir="n/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""
local_patch="bbbio0"

bookworm_version="~bookworm+20240507"
