.PHONY: test build run

GOLANG_VERSION ?= 1.8
USERNAME ?= patricksanders
REPO_NAME ?= go-docker-hello
DOCKER_TAG := ${USERNAME}/${REPO_NAME}:go-${GOLANG_VERSION}

test:
	docker run --rm \
		-v $(shell pwd):/go/src/github.com/${USERNAME}/${REPO_NAME} \
		-w /go/src/github.com/${USERNAME}/${REPO_NAME} \
		golang:${GOLANG_VERSION} \
		go test

build: test
	docker build -t ${USERNAME}/${REPO_NAME} \
		--build-arg GOLANG_VERSION=${GOLANG_VERSION} \
		--build-arg username=${USERNAME} \
		--build-arg repo_name=${REPO_NAME} \
		.
	docker tag ${USERNAME}/${REPO_NAME} ${DOCKER_TAG}

run:
	docker run -it --rm ${DOCKER_TAG}
