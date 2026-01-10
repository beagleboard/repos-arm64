#!/bin/bash -e

mirror="https://deb.debian.org/debian"

package_name="software-properties"
debian_pkg_name="${package_name}"
package_version="0.111"

git_repo=""
git_sha=""
reprepro_dir="s/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

dist="debian-trixie-arm64"
suite="trixie"
deb_arch="arm64"
