#!/bin/bash -e

package_name="bb-wlan0-defaults"
debian_pkg_name="${package_name}"
package_version="1.20240625.0"
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

bullseye_version="~bullseye+20240625"
bookworm_version="~bookworm+20240625"
trixie_version="~trixie+20240625"
jammy_version="~jammy+20240625"
noble_version="~noble+20240625"
