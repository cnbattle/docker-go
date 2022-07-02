# docker-go

my base image for golang.

https://hub.docker.com/r/cnbattle/docker-go


## demo
```dockerfile
FROM cnbattle/docker-go:builder as builder

WORKDIR /app
COPY . .
RUN go env -w GO111MODULE=on && go env -w GOPROXY=https://goproxy.cn,direct
RUN make build

FROM cnbattle/docker-go:runner

RUN echo 'Asia/Shanghai' >/etc/timezone

WORKDIR /www

COPY --from=builder /app/.up.env /www/.env
COPY --from=builder  /app/app /www/app

EXPOSE 8080

ENTRYPOINT ["/www/app","web"]
```
