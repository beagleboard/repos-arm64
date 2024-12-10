#!/bin/bash -e

#https://github.com/beagleboard/customizations

package_name="bb-customizations"
debian_pkg_name="${package_name}"
package_version="1.20241210.0"
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

bullseye_version="~bullseye+20241210"
bookworm_version="~bookworm+20241210"
trixie_version="~trixie+20241210"
jammy_version="~jammy+20241210"
noble_version="~noble+20241210"
