.PHONY: build run

USERNAME=patricksanders
PACKAGE_NAME=hello

build:
	docker build -t ${PACKAGE_NAME} --build-arg username=${USERNAME} --build-arg package_name=${PACKAGE_NAME} .

run:
	docker run -it --rm ${PACKAGE_NAME}
