#!/bin/bash

function tabula_docker_build() {
	git_tag=$1; shift
	version=$(echo $git_tag | sed 's/v//')

	echo "Building tabula version $version from git tag $git_tag"
	docker build \
		--no-cache \
		--build-arg GIT_TAG=$git_tag \
		-t turicas/tabula:$version \
		-f Dockerfile \
		.
}

GIT_TAG="$1"

if [[ -z $GIT_TAG ]] || [[ -z $(grep $GIT_TAG releases.txt) ]]; then
	echo "ERROR: invalid git tag. Usage: $0 <git-tag>"
	echo "Available git tags:"
	cat releases.txt
	exit 1;
fi

tabula_docker_build $GIT_TAG
echo "Build finished. To push the image, run:"
echo "    docker push turicas/tabula:$(echo $git_tag | sed 's/v//')"
