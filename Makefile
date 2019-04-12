build-release: fetch-submodules
	GITHUB_TOKEN=$(GITHUB_TOKEN) ./build-release.sh

.PHONY: update-submodules build-release fetch-submodules
