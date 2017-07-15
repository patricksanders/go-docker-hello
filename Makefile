.PHONY: test build run

GOLANG_VERSION ?= 1.8
USERNAME ?= patricksanders
PACKAGE_NAME ?= go-docker-hello
DOCKER_TAG := ${USERNAME}/${PACKAGE_NAME}:go-${GOLANG_VERSION}

test:
	docker run --rm \
		-v $(shell pwd):/go/src/github.com/${USERNAME}/${PACKAGE_NAME} \
		-w /go/src/github.com/${USERNAME}/${PACKAGE_NAME} \
		golang:${GOLANG_VERSION} \
		go test

build: test
	docker build -t ${USERNAME}/${PACKAGE_NAME} \
		--build-arg GOLANG_VERSION=${GOLANG_VERSION} \
		--build-arg username=${USERNAME} \
		--build-arg package_name=${PACKAGE_NAME} \
		.
	docker tag ${USERNAME}/${PACKAGE_NAME} ${DOCKER_TAG}

run:
	docker run -it --rm ${DOCKER_TAG}
