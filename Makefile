.PHONY: test build run

GOLANG_VERSION ?= 1.11
USERNAME ?= patricksanders
REPO_NAME ?= go-docker-hello
TRAVIS_REPO_SLUG ?= ${USERNAME}/${REPO_NAME}
DOCKER_TAG := ${TRAVIS_REPO_SLUG}:go-${GOLANG_VERSION}

test:
	@docker run --rm \
		-v $(shell pwd):/go/src/github.com/${TRAVIS_REPO_SLUG} \
		-w /go/src/github.com/${TRAVIS_REPO_SLUG} \
		golang:${GOLANG_VERSION} \
		go test

build: test
	@docker build -t ${TRAVIS_REPO_SLUG} \
		--build-arg GOLANG_VERSION=${GOLANG_VERSION} \
		--build-arg username=${USERNAME} \
		--build-arg repo_name=${REPO_NAME} \
		.
	docker tag ${TRAVIS_REPO_SLUG} ${DOCKER_TAG}
ifneq ("$(GOLANG_VERSION)", "latest")
	docker rmi ${TRAVIS_REPO_SLUG}:latest;
endif

run:
	@docker run -it -p 8080:8080 --rm ${DOCKER_TAG}
