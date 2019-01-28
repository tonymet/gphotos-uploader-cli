FROM golang:alpine
RUN mkdir /app
RUN apk add make git gcc
RUN apk add bind-dev musl-dev
ADD . /app/
WORKDIR /app
RUN    make build
ENTRYPOINT ["/app/gphotos-uploader-cli"]