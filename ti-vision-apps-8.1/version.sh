#!/bin/bash -e

package_name="ti-vision-apps-8.1"
debian_pkg_name="${package_name}"
package_version="8.1.0.0"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="t/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

debian_dl_1="http://192.168.1.98/internal/dl/files/tivision_apps.tar.xz"

clear_changelog="enable"

bullseye_version="~bullseye+20220607"
