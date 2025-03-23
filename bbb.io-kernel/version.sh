#!/bin/bash -e

package_name="bbb.io-kernel"
debian_pkg_name="${package_name}"
package_version="1.20250323.0"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="b/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

clear_changelog="enable"

bullseye_version="~bullseye+20250323"
bookworm_version="~bookworm+20250323"
trixie_version="~trixie+20250323"
jammy_version="~jammy+20250323"
noble_version="~noble+20250323"
