#!/bin/bash -e

package_name="bbb.io-keyring"
debian_pkg_name="${package_name}"
package_version="1.20250813.0"
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

bookworm_version="~bookworm+20250813"
trixie_version="~trixie+20250813"
forky_version="~forky+20250813"
noble_version="~noble+20250813"
