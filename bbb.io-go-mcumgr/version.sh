#!/bin/bash -e

#https://github.com/apache/mynewt-mcumgr-cli

package_name="bbb.io-go-mcumgr"
debian_pkg_name="${package_name}"
package_version="0.0.0-git20221004.0"
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

bullseye_version="~bullseye+20230213"
