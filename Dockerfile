ARG GOLANG_VERSION=1.11
FROM golang:${GOLANG_VERSION} as golang-build
ARG username
ARG repo_name
COPY . /go/src/github.com/${username}/${repo_name}
WORKDIR /go/src/github.com/${username}/${repo_name}
ENV CGO_ENABLED=0
ENV GOOS=linux
RUN go build -a -v --ldflags '-extldflags "-static"' -tags netgo -installsuffix netgo -o /program .

FROM scratch
ARG GOLANG_VERSION
ENV GOLANG_VERSION=${GOLANG_VERSION}
COPY --from=golang-build /program /
ENTRYPOINT ["/program"]
