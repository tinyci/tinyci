build: clean
	GITHUB_TOKEN=$(GITHUB_TOKEN) ./build-release.sh

clean:
	rm -rf release release.tar.gz
