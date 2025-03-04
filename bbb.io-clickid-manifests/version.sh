#!/bin/bash -e

package_name="bbb.io-clickid-manifests"
debian_pkg_name="${package_name}"
package_version="1.20230713.1"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://openbeagle.org/beagleconnect/manifesto.git"
git_sha="3acef3c45dd107c39d1c09ba24e8ea0b7d72572b"
reprepro_dir="b/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

clear_changelog="enable"

bullseye_version="~bullseye+20250304"
bookworm_version="~bookworm+20250304"
trixie_version="~trixie+20250304"
jammy_version="~jammy+20250304"
noble_version="~noble+20250304"
