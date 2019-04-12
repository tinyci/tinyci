#!/bin/bash

set -euo pipefail

cd ci-runners
GITHUB_TOKEN=$GITHUB_TOKEN make docker-build
docker create --name ci-runners-temporary ci-runners
cd ..
docker cp ci-runners-temporary:/go/bin/overlay-runner release/binaries/
docker rm ci-runners-temporary
