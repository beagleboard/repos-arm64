#!/bin/bash -e

package_name="ti-tensorflow-src-8.6"
debian_pkg_name="${package_name}"
package_version="8.6.0.1"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="t/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

debian_dl_1="https://github.com/google/flatbuffers/archive/v1.12.0.tar.gz"

clear_changelog="enable"

bullseye_version="~bullseye+20230825"
