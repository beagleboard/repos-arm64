#!/bin/bash -e

#https://packages.debian.org/source/sid/stressapptest
mirror="http://http.debian.net/debian"

package_name="stressapptest"
debian_pkg_name="${package_name}"
package_version="1.0.9-1.git20180809.0"
package_source="${debian_pkg_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://github.com/stressapptest/stressapptest.git"
git_sha="fb72e5e5f0879231f38e0e826a98a6ca2d1ca38e"
reprepro_dir="s/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

bullseye_version="~bullseye+20221021"
