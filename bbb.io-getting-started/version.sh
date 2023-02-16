#!/bin/bash -e

package_name="bbb.io-getting-started"
debian_pkg_name="${package_name}"
package_version="1.20230216.0"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="b/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

debian_dl_1="https://git.beagleboard.org/beagleboard/getting-started-archive/-/raw/main/202302016/beagle-getting-started.img"

clear_changelog="enable"

bullseye_version="~bullseye+20230216"
