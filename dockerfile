FROM golang:1.22.2-alpine3.19 as build

WORKDIR /app

COPY . .

RUN go mod download

RUN go build -o main

FROM alpine:3.19

WORKDIR /app

COPY --from=build /app/main .

ENTRYPOINT ["./main"]
