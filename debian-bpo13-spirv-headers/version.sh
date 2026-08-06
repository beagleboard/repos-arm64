#!/bin/bash -e

mirror="https://deb.debian.org/debian"

package_name="spirv-headers"
debian_pkg_name="${package_name}"
package_version="1.6.1+1.4.357.0"

reprepro_dir="s/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"

dist="debian-trixie-arm64"
suite="trixie"
deb_arch="arm64"
