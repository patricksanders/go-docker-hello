ARG GOLANG_VERSION=1.8
FROM golang:${GOLANG_VERSION} as golang-build
ARG username
ARG package_name
COPY . /go/src/github.com/${username}/${package_name}
WORKDIR /go/src/github.com/${username}/${package_name}
ENV CGO_ENABLED=0
ENV GOOS=linux
RUN go build -a -v --ldflags '-extldflags "-static"' -o /program .

FROM scratch
ARG username
ARG package_name
COPY --from=golang-build /program /
ENTRYPOINT ["/program"]
