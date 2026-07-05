#!/bin/bash -e

mirror="https://deb.debian.org/debian"

package_name="openssh"
debian_pkg_name="${package_name}"
package_version="10.3p1"

reprepro_dir="o/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1~bpo13+1"

dist="debian-trixie-arm64"
suite="trixie"
deb_arch="arm64"
