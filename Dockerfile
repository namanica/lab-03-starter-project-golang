# Етап 1 — збірка
FROM golang:1.21-alpine AS builder

WORKDIR /app

COPY . .

RUN go mod tidy
RUN go build -o server .

# Етап 2 — "порожній" образ
FROM scratch

COPY --from=builder /app/server /server

# Запускаємо бінарник
ENTRYPOINT ["/server"]
