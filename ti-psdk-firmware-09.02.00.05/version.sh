#!/bin/bash -e

#https://git.ti.com/gitweb?p=processor-sdk/psdk_fw.git;a=summary

package_name="ti-psdk-firmware-09.02.00.05"
debian_pkg_name="${package_name}"
package_version="9.2.0.5"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0bbbio3"
debian_patch=""
debian_diff=""

clear_changelog="enable"

bullseye_version="~bullseye+20240606"
bookworm_version="~bookworm+20240606"
trixie_version="~trixie+20240606"
jammy_version="~jammy+20240606"
noble_version="~noble+20240606"
