FROM golang:1.18-alpine

LABEL maintainer="cnbattle@qiaicn@gmail.com"
LABEL website="https://github.com/cnbattle/docker-go"

RUN apk --no-cache add ca-certificates tzdata make git gcc g++
RUN go install github.com/go-task/task/v3/cmd/task@latest
RUN go install github.com/swaggo/swag/cmd/swag@latest
