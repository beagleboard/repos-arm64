#!/bin/bash -e

#https://packages.debian.org/source/bookworm/pkg-kde-tools
mirror="https://deb.debian.org/debian"

package_name="pkg-kde-tools"
debian_pkg_name="${package_name}"
package_version="0.15.38"

git_repo=""
git_sha=""
reprepro_dir="p/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version=""
debian_untar=""
debian_patch=""

dist="debian"
suite="bullseye"
deb_arch="arm64"
