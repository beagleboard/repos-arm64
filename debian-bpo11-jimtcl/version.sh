#!/bin/bash -e

#https://packages.debian.org/source/bookworm/jimtcl
mirror="https://deb.debian.org/debian"

package_name="jimtcl"
debian_pkg_name="${package_name}"
package_version="0.81+dfsg0"

git_repo=""
git_sha=""
reprepro_dir="j/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-2"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

dist="debian"
suite="bullseye"
deb_arch="arm64"
