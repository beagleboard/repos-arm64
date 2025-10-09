#!/bin/bash -e

#https://openbeagle.org/beagleboard/u-boot/
#https://github.com/u-boot/u-boot/commits/master

package_name="bb-u-boot-am625-osd625-brk"
debian_pkg_name="${package_name}"
package_version="2024.04.20241129.2"
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

bookworm_version="~bookworm+20251009"
trixie_version="~trixie+20251009"
forky_version="~forky+20251009"
noble_version="~noble+20251009"
