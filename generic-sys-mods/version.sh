#!/bin/bash -e

package_name="generic-sys-mods"
debian_pkg_name="${package_name}"
package_version="1.20250515.1"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="g/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

clear_changelog="enable"

jammy_version="~jammy+20250326"
bullseye_version="~bullseye+20250515"
bookworm_version="~bookworm+20250515"
trixie_version="~trixie+20250515"
noble_version="~noble+20250515"
