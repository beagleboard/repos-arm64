#!/bin/bash -e

package_name="ti-onnxruntime-8.1"
debian_pkg_name="${package_name}"
package_version="8.1.0.17"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="t/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

debian_dl_1="https://github.com/protocolbuffers/protobuf/releases/download/v3.11.3/protoc-3.11.3-linux-aarch_64.zip"

clear_changelog="enable"

bullseye_version="~bullseye+20220518"
