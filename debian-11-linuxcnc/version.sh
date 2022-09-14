#!/bin/bash -e

#https://tracker.debian.org/pkg/linuxcnc
#https://packages.debian.org/source/testing/linuxcnc

mirror="http://http.debian.net/debian"

package_name="linuxcnc"
debian_pkg_name="${package_name}"
package_version="2.9.0~pre0+git20220906.02744cdef6"
package_source="${debian_pkg_name}_${package_version}.orig.tar.gz"
src_dir="${package_name}-${package_version}"

git_repo=""
git_sha=""
reprepro_dir="l/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""
local_patch="bbbio0"

bullseye_version="~bullseye+20220914"
