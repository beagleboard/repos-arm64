#!/bin/bash -e

package_name="bbb.io-clickid-manifests"
debian_pkg_name="${package_name}"
package_version="1.20230616.2"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://git.beagleboard.org/beagleconnect/manifesto.git"
git_sha="d937e007d09e16aa53e8f7407f9126acd9e711c8"
reprepro_dir="b/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

clear_changelog="enable"

bullseye_version="~bullseye+20230622"
bookworm_version="~bookworm+20230622"
trixie_version="~trixie+20230622"
