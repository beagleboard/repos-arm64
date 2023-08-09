#!/bin/bash -e

#https://github.com/beagleboard/k3-image-gen

package_name="bb-k3-image-gen-beagleboneai64"
debian_pkg_name="${package_name}"
package_version="1.20221128.0"
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

bullseye_version="~bullseye+20230808"
bookworm_version="~bookworm+20230808"
