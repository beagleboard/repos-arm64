#!/bin/bash -e

package_name="rtw88-modprobe-conf"
debian_pkg_name="${package_name}"
package_version="1.20250822.1"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="r/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

clear_changelog="enable"

bookworm_version="~bookworm+20250822"
trixie_version="~trixie+20250822"
forky_version="~forky+20250822"
noble_version="~noble+20250822"
