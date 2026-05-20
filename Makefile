all: build
.PHONY: all

# Use local repo to avoid podman accidentally pulling existing remote manifest list and duplicating manifest in it.
REPO :=localhost/containerfiles
PLATFORM :=linux/amd64
JOBS ?=1

build:
	REPO_REF='$(REPO)' PLATFORM='$(PLATFORM)' JOBS='$(JOBS)' ./hack/build-images.sh
.PHONY: build
