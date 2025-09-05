#!/bin/bash -e

package_name="generic-sys-mods"
debian_pkg_name="${package_name}"
package_version="1.20250905.0"
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

bookworm_version="~bookworm+20250905"
trixie_version="~trixie+20250905"
forky_version="~forky+20250905"
noble_version="~noble+20250905"
