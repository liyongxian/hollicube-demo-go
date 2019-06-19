FROM golang:1.11
EXPOSE 8010
COPY ./hello-server /usr/local/bin/
CMD ["hello-server"]

