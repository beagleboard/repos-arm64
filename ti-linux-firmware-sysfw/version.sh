#!/bin/bash -e

#https://git.ti.com/gitweb?p=processor-firmware/ti-linux-firmware.git;a=shortlog;h=refs/heads/ti-linux-firmware

package_name="ti-linux-firmware-sysfw"
debian_pkg_name="${package_name}"
package_version="0.0.0-09.01.00.008.0"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

clear_changelog="enable"

bullseye_version="~bullseye+20231222"
bookworm_version="~bookworm+20231222"
trixie_version="~trixie+20231222"
jammy_version="~jammy+20231222"
noble_version="~noble+20231222"
