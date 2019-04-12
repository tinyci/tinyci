#!/bin/bash

set -euo pipefail

cd ci-agents
make dist
mv tinyci*.tar.gz ../release/ci-agents.tar.gz
cd ../release/
tar --strip 1 -C binaries -xpf ci-agents.tar.gz
rm ci-agents.tar.gz
