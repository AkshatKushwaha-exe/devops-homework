FROM golang:1.22-alpine AS builder

WORKDIR /src

COPY go.mod ./
RUN go mod download

COPY main.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o /out/server main.go

FROM alpine:3.20

RUN adduser -D -u 10001 appuser

COPY --from=builder /out/server /usr/local/bin/server

USER appuser
EXPOSE 8080

CMD ["/usr/local/bin/server"]
