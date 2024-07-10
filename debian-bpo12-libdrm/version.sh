#!/bin/bash -e

mirror="https://deb.debian.org/debian"

package_name="libdrm"
debian_pkg_name="${package_name}"
package_version="2.4.121"

git_repo=""
git_sha=""
reprepro_dir="libd/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-2"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

dist="debian"
suite="bookworm"
deb_arch="arm64"
