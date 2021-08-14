FROM golang:1.16.7-alpine3.14 AS base

FROM base as builder

COPY . /app
WORKDIR /app
RUN go build -o app
ENTRYPOINT ["./app"]

FROM alpine:3.14 AS runtime
COPY --from=builder /app/app /app
ENTRYPOINT ["/app"]
