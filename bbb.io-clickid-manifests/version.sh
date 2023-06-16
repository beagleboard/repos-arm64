#!/bin/bash -e

package_name="bbb.io-clickid-manifests"
debian_pkg_name="${package_name}"
package_version="1.20230616.1"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://git.beagleboard.org/beagleconnect/manifesto.git"
git_sha="cade30fef0716c6fdbcd77f53a74e0a6ca30bd4b"
reprepro_dir="b/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

clear_changelog="enable"

bullseye_version="~bullseye+20230616"
bookworm_version="~bookworm+20230616"
trixie_version="~trixie+20230616"
