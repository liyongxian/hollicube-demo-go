FROM golang:1.12-alpine AS builder
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk add --no-cache \
    git \
    make || apk update && apk upgrade
WORKDIR /go/src/hollicube-demo-go
RUN git clone --depth 1 https://github.com/liyongxian/hollicube-demo-go.git . && go build -o hello-server

FROM alpine:3.7
COPY --from=builder /go/src/hollicube-demo-go/hello-server /usr/local/bin/hello-server
RUN addgroup hollicube && adduser -S -D hollicube -G hollicube
RUN  chown -R hollicube:hollicube /usr/local/bin/hello-server  &&  chmod a+x /usr/local/bin/hello-server
USER hollicube
EXPOSE 8010
CMD ["sudo hello-server"]
