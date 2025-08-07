#!/bin/bash -e

#https://git.ti.com/cgit/k3conf/k3conf/

package_name="ti-k3conf"
debian_pkg_name="${package_name}"
package_version="0.3.0-0.git20250807.0"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="http://forgejo.gfnd.rcn-ee.org:3000/TexasInstruments/k3conf.git"
git_sha="b35ec6f6c6e11471c5d06f8c24ac396077f893be"
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

clear_changelog="enable"

bullseye_version="~bullseye+20250807"
bookworm_version="~bookworm+20250807"
trixie_version="~trixie+20250807"
noble_version="~noble+20250807"
