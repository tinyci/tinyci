update-submodules:
	git submodule update --init --recursive

build-release: fetch-submodules
	GITHUB_TOKEN=$(GITHUB_TOKEN) ./build-release.sh

fetch-submodules:
	git submodule init
	git submodule update

.PHONY: update-submodules build-release fetch-submodules
