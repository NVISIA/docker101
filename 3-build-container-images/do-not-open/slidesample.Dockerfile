# syntax=docker/dockerfile:1
FROM golang:1.21-alpine
RUN mkdir -p /src/cmd
WORKDIR /src
ADD https://github.com/dockersamples/buildme/tree/6de05ac9a2afc8023df00cb285170511c5cad571/cmd ./cmd
RUN go mod download
RUN go build -o /bin/client ./cmd/client
RUN go build -o /bin/server ./cmd/server
ENTRYPOINT [ "/bin/server" ]
