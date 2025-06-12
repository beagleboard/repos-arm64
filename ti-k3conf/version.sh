#!/bin/bash -e

#https://git.ti.com/cgit/k3conf/k3conf/

package_name="ti-k3conf"
debian_pkg_name="${package_name}"
package_version="0.3.0-0.git20250522.1"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="http://forgejo.gfnd.rcn-ee.org:3000/TexasInstruments/k3conf.git"
git_sha="ea9938bf9cafd9c0cb05ef060a713ab4ac72270f"
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

clear_changelog="enable"

bullseye_version="~bullseye+20250612"
bookworm_version="~bookworm+20250612"
trixie_version="~trixie+20250612"
noble_version="~noble+20250612"
