#!/bin/bash -e

#https://packages.debian.org/source/bookworm/spirv-headers
mirror="https://deb.debian.org/debian"

package_name="spirv-headers"
debian_pkg_name="${package_name}"
package_version="1.6.1+1.3.216.0"

git_repo=""
git_sha=""
reprepro_dir="s/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

dist="debian"
suite="bullseye"
deb_arch="arm64"
