#!/bin/bash -e

mirror="http://http.debian.net/debian"

package_name="xorg-server"
debian_pkg_name="${package_name}"
epoch="2"
package_version="21.1.22"
package_source="${debian_pkg_name}_${package_version}-1.tar.gz"
src_dir="${package_name}.git"

git_repo=""
git_sha=""
reprepro_dir="x/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"
debian_untar=""
debian_patch=""
local_patch="bbbio0"

trixie_version="~trixie+20260417"
