#!bash

set -xe

origpwd="${PWD}"

readManifest() {
  echo $(echo "$line" | awk "{ print \$$1 }")
}

tempdir="$(mktemp -d /tmp/tinyci.XXXXXX)"
removeTempdir() {
  if [ "x${tempdir}" != "x" ]
  then
    rm -rf "${tempdir}"
  fi
}
trap removeTempdir INT QUIT

while read line
do
  target="$(readManifest 1)"
  repo="$(readManifest 2)"
  sha="$(readManifest 3)"

  cd "$tempdir"
  git clone "${repo}" "${target}"
  cd "${target}"
  git checkout "${sha}"
  make dist
done < manifest.txt

cd "${origpwd}"
bash assemble.sh "${tempdir}"
