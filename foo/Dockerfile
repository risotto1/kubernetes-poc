FROM golang:alpine AS builder
ADD . /app
WORKDIR /app
RUN CGO_ENABLED=0 go build -o bin

FROM alpine
COPY --from=builder /app .
ENTRYPOINT ["./bin"]

