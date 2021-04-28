FROM golang:latest as builder

ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64
WORKDIR /go/src/github.com/yuki/go-server-example
COPY . .
RUN go build sample.go

# runtime image
FROM alpine
COPY --from=builder /go/src/github.com/yuki/go-server-example /app

CMD /app/sample $PORT