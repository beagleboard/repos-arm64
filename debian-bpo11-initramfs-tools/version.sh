#!/bin/bash -e

mirror="http://http.debian.net/debian"

package_name="initramfs-tools"
debian_pkg_name="${package_name}"
package_version="0.140"

git_repo=""
git_sha=""
reprepro_dir="i/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}"
#debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

dist="debian"
suite="bullseye"
deb_arch="arm64"
