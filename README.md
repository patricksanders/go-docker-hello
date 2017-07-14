# go-docker-hello

This is a simple example of building a docker image to run a Go program.

Because it uses multi-stage build, Docker CE 17.06 or newer is required.

Go version can be changed by passing the `GOLANG_VERSION` arg from the Makefile or by modifying the default in the Dockerfile.
