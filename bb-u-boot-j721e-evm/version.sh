#!/bin/bash -e

#https://github.com/u-boot/u-boot/commits/master

package_name="bb-u-boot-j721e-evm"
debian_pkg_name="${package_name}"
package_version="2021.10.20210726.0"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="b/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

bullseye_version="~bullseye+20210807"
