#!/bin/bash -e

#https://tracker.debian.org/pkg/qemu
#http://deb.debian.org/debian/pool/main/q/qemu/qemu_6.1+dfsg.orig.tar.xz

mirror="http://http.debian.net/debian"

package_name="qemu"
debian_pkg_name="${package_name}"
package_version="6.1+dfsg"
package_source="${debian_pkg_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}-6.1.0"

git_repo=""
git_sha=""
reprepro_dir="q/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-8"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""
local_patch="rcnee0"

bullseye_version="~bullseye+20211203"
