#!/bin/bash -e

#https://packages.debian.org/source/bookworm-backports/directx-headers
mirror="https://deb.debian.org/debian"

package_name="directx-headers"
debian_pkg_name="${package_name}"
package_version="1.614.1"

git_repo=""
git_sha=""
reprepro_dir="d/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1~bpo12+1"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

dist="debian"
suite="bookworm"
deb_arch="arm64"
