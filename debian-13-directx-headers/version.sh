#!/bin/bash -e

mirror="http://http.debian.net/debian"

package_name="directx-headers"
debian_pkg_name="${package_name}"
package_version="1.618.2"
package_source="${debian_pkg_name}_${package_version}.orig.tar.gz"
src_dir="DirectX-Headers-${package_version}"

git_repo=""
git_sha=""
reprepro_dir="d/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""
local_patch="bbbio0"

trixie_version="~trixie+20251025"
