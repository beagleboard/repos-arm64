#!/bin/bash -e

#mirror="https://deb.debian.org/debian"
mirror="https://incoming.debian.org/debian-buildd"

package_name="venus-protocol"
debian_pkg_name="${package_name}"
package_version="1.1.3"

reprepro_dir="v/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"

dist="debian-forky-arm64"
suite="forky"
deb_arch="arm64"
