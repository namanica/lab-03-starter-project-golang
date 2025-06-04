# Етап 1 — builder
FROM golang:1.21-alpine AS builder

WORKDIR /app

COPY . .

RUN go mod tidy
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o server .

# Етап 2 — distroless
FROM gcr.io/distroless/static
COPY --from=builder /app/server /
ENTRYPOINT ["/server"]
