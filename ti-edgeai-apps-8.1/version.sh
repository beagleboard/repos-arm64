#!/bin/bash -e

##TODO: these files... https://git.ti.com/gitweb?p=edgeai/edge_ai_apps.git;a=blob;f=apps_cpp/cmake/common.cmake;h=206568364ee8d6465100399b8d3c44f428437d0f;hb=8862d5fe140943868525380f3a122c2b6da40f43

package_name="ti-edgeai-apps-8.1"
debian_pkg_name="${package_name}"
package_version="8.1.0.3"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="t/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-0"
debian_untar=""
debian_patch=""

clear_changelog="enable"

bullseye_version="~bullseye+20220524"
