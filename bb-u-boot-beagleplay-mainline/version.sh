#!/bin/bash -e

#https://git.beagleboard.org/beagleboard/u-boot/
#https://github.com/u-boot/u-boot/commits/master

package_name="bb-u-boot-beagleplay-mainline"
debian_pkg_name="${package_name}"
package_version="2024.01.20231218.3"
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

bullseye_version="~bullseye+20231228"
bookworm_version="~bookworm+20231228"
trixie_version="~trixie+20231228"
jammy_version="~jammy+20231228"
noble_version="~noble+20231228"
