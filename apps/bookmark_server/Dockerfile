FROM nimlang/nim:1.4.8-alpine AS base

WORKDIR /app
COPY . /app

FROM base AS builder

RUN nimble build -Y
ENTRYPOINT ["./bookmark_server"]

FROM alpine:3.14 AS runtime

COPY --from=builder /app/bookmark_server /app
ENTRYPOINT ["/app"]