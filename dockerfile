FROM golang:1.14.1-alpine3.11 as builder

RUN apk update && apk add --no-cache git ca-certificates tzdata && update-ca-certificates

WORKDIR $GOPATH/src/soma
COPY . .

# RUN go get -d -v

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build \
      -ldflags='-w -s -extldflags "-static"' -a \
      -o /go/src/soma .

FROM scratch

COPY --from=builder /go/src/soma .

ENTRYPOINT ["/go/src/soma"]