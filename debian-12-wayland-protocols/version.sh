#!/bin/bash -e

#mirror="http://http.debian.net/debian"
mirror="https://snapshot.debian.org/archive/debian/20250106T154800Z"

package_name="wayland-protocols"
debian_pkg_name="${package_name}"
package_version="1.39"
package_source="${debian_pkg_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}-${package_version}"

git_repo=""
git_sha=""
reprepro_dir="w/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1~bpo12+2"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""
local_patch="bbbio0"

bookworm_version="~bookworm+20250213"
