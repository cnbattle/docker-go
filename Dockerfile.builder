FROM golang:1.16-alpine

LABEL maintainer="cnbattle@qiaicn@gmail.com"
LABEL website="https://github.com/cnbattle/docker-go"

RUN apk --no-cache add ca-certificates tzdata make git gcc
