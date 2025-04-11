#!/bin/bash -e

mirror="https://deb.debian.org/debian"

package_name="firmware-nonfree"
debian_pkg_name="${package_name}"
package_version="20241210"

git_repo=""
git_sha=""
reprepro_dir="f/${package_name}"
dl_path="pool/non-free-firmware/${reprepro_dir}/"

debian_version="${package_version}-1~bpo12+1"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

dist="debian"
suite="bookworm"
deb_arch="arm64"
