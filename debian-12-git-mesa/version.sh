#!/bin/bash -e

#https://gitlab.freedesktop.org/mesa/mesa/-/commits/23.3/
mirror="http://http.debian.net/debian"

package_name="mesa"
debian_pkg_name="${package_name}"
package_version="23.2.0-1.git20230903.4"
package_source="${debian_pkg_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://gitea.gfnd.rcn-ee.org/RobertCNelson/mesa.git"
git_sha="bcc97bf6fbca60ccaaab9b40076a6227b426754b"
reprepro_dir="m/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""

bookworm_version="~bookworm+20230911"
