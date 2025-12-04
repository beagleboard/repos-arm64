#!/bin/bash -e

#https://git.ti.com/cgit/k3conf/k3conf/

package_name="ti-k3conf"
debian_pkg_name="${package_name}"
package_version="0.4.0-0.git20251204.0"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="http://forgejo.gfnd.rcn-ee.org:3000/TexasInstruments/k3conf.git"
git_sha="4e3a44c4b961831f2de80606942dd0d8eb508eca"
reprepro_dir="t/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

clear_changelog="enable"

bookworm_version="~bookworm+20251204"
trixie_version="~trixie+20251204"
forky_version="~forky+20251204"
noble_version="~noble+20251204"
