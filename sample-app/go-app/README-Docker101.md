# Build and run test application

This repository contains an example Go application, used in the
[Build with Docker guide](https://docs.docker.com/build/guide).

## Overview of Dockerfile examples

### 1.Dockerfile

#### Introduction

[Dockerfile](./chapters/1.Dockerfile)

### 2.Dockerfile

#### Layers

[Dockerfile](./chapters/2.Dockerfile)

### 3.Dockerfile

#### Multi-stage

[Dockerfile](./chapters/3.Dockerfile)

### 4.Dockerfile

#### Mounts

[Dockerfile](./chapters/4.Dockerfile)

### 5.Dockerfile

#### Build arguments

[Dockerfile](./chapters/5.Dockerfile)

### 6.Dockerfile

#### Export binaries

[Dockerfile](./chapters/6.Dockerfile)

### 7.Dockerfile

#### Test

[Dockerfile](./chapters/7.Dockerfile)

### 8.Dockerfile

#### Multi-platform

[Dockerfile](./chapters/8.Dockerfile)

### Bonus Exercises

#### Simple Single Container

```bash
# build and run the app
docker build -t gotest:v1 .
docker run -d --name gotest1  gotest:v1 

# run the client in the container
docker exec -it gotest1 /bin/client

# see how proc 1/server is listening on port 3000 inside the container, but not exposed outside the container 
docker exec -it gotest1 /bin/sh
> netstat -tulp
```

### Multi-Stage build Multi Container

```bash
## Build and run the server
docker build -t gotest-server:v3 --target server -f ./chapters/3.Dockerfile .
docker run -d --name gotest-server  gotest-server:v3 

# Get the server IP
docker inspect gotest-server | grep IPAddress

# Update the client base URL in /cmd/client/request.go to something like...
# var baseURL string = "http://172.17.0.4

# build the client
docker build -t gotest-client:v3 --target client -f ./chapters/3.Dockerfile .
docker run -it --rm gotest-client:v3 /bin/client

#Check the sizes of single stage to multi stage 
docker image ls | grep gotest

#Clean up
docker rm -f $(docker container ls -aq)
```

### Using Docker Network and DNS

```bash
# Create a docker network
docker network create gotest-net
# look at new bridge network
docker network ls

## Build and run the server
docker build -t gotest-server:v4 --target server -f ./chapters/3.Dockerfile .
docker run -d --name gotest-server --network gotest-net gotest-server:v4 

# Update the client base URL in /cmd/client/request.go to something like...
# var baseURL string = "http://gotest-server

# build the client
docker build -t gotest-client:v4 --target client -f ./chapters/3.Dockerfile .
docker run -it --rm --name gotest-client --network gotest-net gotest-client:v4 /bin/client

# in a separate terminal, with CLIENT STILL RUNNING look at the network
docker network inspect gotest-net


#Clean up
docker rm -f $(docker container ls -aq)
docker network rm gotest-net
```