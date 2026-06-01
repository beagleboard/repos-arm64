#!/bin/bash -e

mirror="https://deb.debian.org/debian"

package_name="debootstrap"
debian_pkg_name="${package_name}"
package_version="1.0.144"

reprepro_dir="d/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"

dist="debian-trixie-arm64"
suite="trixie"
deb_arch="arm64"
