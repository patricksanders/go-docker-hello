.PHONY: build run

GOLANG_VERSION ?= 1.8
USERNAME ?= patricksanders
PACKAGE_NAME ?= hello

build:
	docker build -t ${USERNAME}/${PACKAGE_NAME} \
		--build-arg GOLANG_VERSION=${GOLANG_VERSION} \
		--build-arg username=${USERNAME} \
		--build-arg package_name=${PACKAGE_NAME} \
		.

run:
	docker run -it --rm ${USERNAME}/${PACKAGE_NAME}
