#!/bin/bash -e

#https://packages.debian.org/source/sid/stressapptest
mirror="http://http.debian.net/debian"

package_name="stressapptest"
debian_pkg_name="${package_name}"
package_version="1.0.9-1.git20220922.0"
package_source="${debian_pkg_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://github.com/stressapptest/stressapptest.git"
git_sha="c497e64fa6d312e38a2fbfa221e3c76660c8e871"
reprepro_dir="s/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

bullseye_version="~bullseye+20221021"
