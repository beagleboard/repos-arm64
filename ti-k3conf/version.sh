#!/bin/bash -e

#https://git.ti.com/cgit/k3conf/k3conf/

package_name="ti-k3conf"
debian_pkg_name="${package_name}"
package_version="0.3.0-0.git20250828.0"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="http://forgejo.gfnd.rcn-ee.org:3000/TexasInstruments/k3conf.git"
git_sha="3de294db4f2cd75404f358768f4be8f8fa3132d7"
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

clear_changelog="enable"

bookworm_version="~bookworm+20250828"
trixie_version="~trixie+20250828"
forky_version="~forky+20250828"
noble_version="~noble+20250828"
