#!/bin/bash -e

#https://packages.debian.org/source/stable/libcamera

#mirror="http://http.debian.net/debian"
mirror="https://snapshot.debian.org/archive/debian/20230616T215730Z"

package_name="libcamera"
debian_pkg_name="${package_name}"
package_version="0.5.0"
package_source="${debian_pkg_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}-${package_version}"

git_repo=""
git_sha=""
reprepro_dir="libc/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-2"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""
local_patch="bbbio2"

bookworm_version="~bookworm+20240124"
bullseye_version="~bullseye+20240124"
