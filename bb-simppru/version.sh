#!/bin/bash -e

#https://github.com/VedantParanjape/simpPRU

package_name="bb-simppru"
debian_pkg_name="${package_name}"
package_version="1.4.20220721.0"
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

buster_version="~buster+20220810"
bullseye_version="~bullseye+20220810"
