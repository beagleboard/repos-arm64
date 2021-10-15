#!/bin/bash -e

#https://github.com/beagleboard/optee_os

package_name="bb-optee-os-k3-j721e"
debian_pkg_name="${package_name}"
package_version="3.12.0.20210120.5"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="b/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

bullseye_version="~bullseye+20211015"
