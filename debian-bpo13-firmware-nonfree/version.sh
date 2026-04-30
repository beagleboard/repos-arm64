#!/bin/bash -e

mirror="https://deb.debian.org/debian"

package_name="firmware-nonfree"
debian_pkg_name="${package_name}"
package_version="20260410"

reprepro_dir="f/${package_name}"
dl_path="pool/non-free-firmware/${reprepro_dir}/"

debian_version="${package_version}-1~bpo13+1"

dist="debian-trixie-arm64"
suite="trixie"
deb_arch="arm64"
