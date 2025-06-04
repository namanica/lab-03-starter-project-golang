# Базовий образ з Go
FROM golang:1.21-alpine

WORKDIR /app

# Копіюємо файли
COPY . .

# Завантажуємо залежності
RUN go mod tidy

# Компілюємо виконуваний файл
RUN go build -o server .

# Відкриваємо порт (якщо потрібен)
EXPOSE 8080

# Запускаємо
CMD ["./server"]
