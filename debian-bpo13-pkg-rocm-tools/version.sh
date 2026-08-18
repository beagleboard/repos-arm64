#!/bin/bash -e

mirror="https://deb.debian.org/debian"

package_name="pkg-rocm-tools"
debian_pkg_name="${package_name}"
package_version="0.9.8"

reprepro_dir="p/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}"

dist="debian-trixie-arm64"
suite="trixie"
deb_arch="arm64"
