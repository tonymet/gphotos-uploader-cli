FROM golang:alpine
RUN apk add make git gcc
RUN apk add bind-dev musl-dev
RUN mkdir /app
WORKDIR /app
COPY ./gphotos-uploader-cli/go.mod ./gphotos-uploader-cli/go.sum ./
RUN go mod download
ADD ./gphotos-uploader-cli/ /app/
ADD ./oauth2-noserver  /go/pkg/mod/github.com/nmrshll/oauth2-noserver@v0.0.0-20180827223500-16b622b98a45/
RUN    make build
ENTRYPOINT ["/app/gphotos-uploader-cli"]
