FROM golang:1.14.1-alpine3.11 as builder

RUN apk update && apk add --no-cache git ca-certificates tzdata && update-ca-certificates

WORKDIR /go/src/soma
COPY . .

# RUN go get -d -v

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build \
      -ldflags='-w -s -extldflags "-static"' -a \
      -o /go/src/soma 

FROM scratch

COPY --from=builder /go/src/soma .

ENTRYPOINT ["/go/src/soma"]

# FROM golang:1.14-alpine as builder

# WORKDIR /go/src/soma
# COPY ./src/soma/main.go .
# RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-w -extldflags "-static"' -o soma
# RUN ls

# FROM scratch
# COPY --from=builder  /go/src/soma . 

# CMD [ "./soma" ]