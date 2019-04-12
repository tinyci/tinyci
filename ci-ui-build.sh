#!/bin/bash

set -euo pipefail

cd ci-ui
ENDPOINT_TYPE=pathonly make build
mkdir ../release/ci-ui
tar -C ../release/ci-ui -xpf build.tar.gz
