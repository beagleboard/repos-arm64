#!/bin/bash -e

#https://snapshot.debian.org/package/llvm-toolchain-21/
#20260404
#https://snapshot.debian.org/archive/debian/20250926T083837Z/pool/main/l/llvm-toolchain-21/llvm-toolchain-21_21.1.2-2.dsc
#20260405
#https://snapshot.debian.org/archive/debian/20250930T143107Z/pool/main/l/llvm-toolchain-21/llvm-toolchain-21_21.1.2-3.dsc
#20260406
#https://snapshot.debian.org/archive/debian/20251008T090045Z/pool/main/l/llvm-toolchain-21/llvm-toolchain-21_21.1.2-4.dsc
#20260407
#https://snapshot.debian.org/archive/debian/20251013T025134Z/pool/main/l/llvm-toolchain-21/llvm-toolchain-21_21.1.3-1.dsc
#20260409
#https://snapshot.debian.org/archive/debian/20251021T143127Z/pool/main/l/llvm-toolchain-21/llvm-toolchain-21_21.1.4-1.dsc
#20260410
#https://snapshot.debian.org/archive/debian/20251023T024602Z/pool/main/l/llvm-toolchain-21/llvm-toolchain-21_21.1.4-2.dsc
#20260411
#https://snapshot.debian.org/archive/debian/20251024T204237Z/pool/main/l/llvm-toolchain-21/llvm-toolchain-21_21.1.4-3.dsc
#20260411
#https://snapshot.debian.org/archive/debian/20251030T144357Z/pool/main/l/llvm-toolchain-21/llvm-toolchain-21_21.1.4-5.dsc
#20260411
#https://snapshot.debian.org/archive/debian/20251105T023511Z/pool/main/l/llvm-toolchain-21/llvm-toolchain-21_21.1.4-7.dsc
#20260412
#https://snapshot.debian.org/archive/debian/20251105T150124Z/pool/main/l/llvm-toolchain-21/llvm-toolchain-21_21.1.4-8.dsc
#20260412
#https://snapshot.debian.org/archive/debian/20251111T144600Z/pool/main/l/llvm-toolchain-21/llvm-toolchain-21_21.1.5-1.dsc
#20260412
#https://snapshot.debian.org/archive/debian/20251121T203836Z/pool/main/l/llvm-toolchain-21/llvm-toolchain-21_21.1.6-1.dsc
#20260413
#https://snapshot.debian.org/archive/debian/20251130T082954Z/pool/main/l/llvm-toolchain-21/llvm-toolchain-21_21.1.6-3.dsc
#20260414
#https://snapshot.debian.org/archive/debian/20251210T085525Z/pool/main/l/llvm-toolchain-21/llvm-toolchain-21_21.1.7-1.dsc
#20260415
#https://snapshot.debian.org/archive/debian/20251216T203730Z/pool/main/l/llvm-toolchain-21/llvm-toolchain-21_21.1.8-1.dsc
#20260416
#https://snapshot.debian.org/archive/debian/20260120T083844Z/pool/main/l/llvm-toolchain-21/llvm-toolchain-21_21.1.8-2.dsc
#20260416
#https://snapshot.debian.org/archive/debian/20260203T142522Z/pool/main/l/llvm-toolchain-21/llvm-toolchain-21_21.1.8-3.dsc
#https://packages.debian.org/source/forky/llvm-toolchain-21

#mirror="https://deb.debian.org/debian"
mirror="https://snapshot.debian.org/archive/debian/20260203T142522Z"

package_name="llvm-toolchain-21"
debian_pkg_name="${package_name}"
package_version="21.1.8"

git_repo=""
git_sha=""
reprepro_dir="l/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-3"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

dist="debian-trixie-arm64"
suite="trixie"
deb_arch="arm64"
