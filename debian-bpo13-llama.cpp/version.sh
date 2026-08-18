#!/bin/bash -e

mirror="https://deb.debian.org/debian"

package_name="llama.cpp"
debian_pkg_name="${package_name}"
package_version="10271+dfsg"

reprepro_dir="l/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"

dist="debian-trixie-arm64"
suite="trixie"
deb_arch="arm64"
