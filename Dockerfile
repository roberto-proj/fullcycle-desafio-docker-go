FROM golang:latest AS builder
WORKDIR /usr/src/app
RUN go mod init example/hello
COPY hello.go .
RUN go build hello.go

FROM scratch
COPY --from=builder /usr/src/app .
CMD ["./hello"]

# docker run robertoproj/fullcycle