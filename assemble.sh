#!bash

set -xe

wd="${PWD}"

dir="${1}"
cd "${dir}"

tempdir="$(mktemp -d '/tmp/build.XXXXXX')"
removeTempdir() {
  if [ "x${tempdir}" != "x" ]
  then
    rm -rf "${tempdir}"
  fi
}
trap removeTempdir INT QUIT

release="tinyci-$(cat ci-agents/VERSION)"

releasedir="${tempdir}/${release}"
mkdir -vp "${releasedir}/bin" "${releasedir}/ui"
cd "${dir}"
cp -v -aRp "ci-agents/build/${release}/migrations" "${releasedir}/migrations"
find "ci-agents/build/${release}" -maxdepth 1 -type f | xargs -I{} cp -v -aRp {} "${releasedir}/bin"
cp -v -aRp ci-runners/build/* "${releasedir}/bin"
tar vxz --strip-components=1 -f ci-ui/ci-ui.tar.gz -C "${releasedir}/ui"
cd "${tempdir}"
tar cvzf "${wd}/${release}.tar.gz" "${release}"

rm -rf "${tempdir}" "${dir}"
