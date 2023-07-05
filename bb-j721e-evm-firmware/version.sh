#!/bin/bash -e

#https://github.com/beagleboard/j721e-evm

package_name="bb-j721e-evm-firmware"
debian_pkg_name="${package_name}"
package_version="1.20230705.0"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="b/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

clear_changelog="enable"

bullseye_version="~bullseye+20230705"
bookworm_version="~bookworm+20230705"
trixie_version="~trixie+20230705"
jammy_version="~jammy+20230705"
