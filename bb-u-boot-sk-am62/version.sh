#!/bin/bash -e

package_name="bb-u-boot-sk-am62"
debian_pkg_name="${package_name}"
package_version="2021.01.20220527.2"
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

bullseye_version="~bullseye+20220727"
