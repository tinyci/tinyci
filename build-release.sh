#!/bin/bash

set -euo pipefail

rm -rf release
mkdir release
mkdir release/binaries

# build ci-ui
./ci-ui-build.sh
# build ci-agents
./ci-agents-build.sh
# build overlay-runner
GITHUB_TOKEN=$GITHUB_TOKEN ./ci-runners-build.sh
cd release
tar -zvcpf ../release.tar.gz $(find . -type f | sed -e 's!./!!')
