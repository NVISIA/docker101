# Build and run test application

```bash
docker build -t gotest:v0 .
docker run -d --name gotest  gotest:v0 
docker exec -it gotest /bin/client

docker exec -it gotest /bin/sh
> netstat -tulp
# see how proc 1/server is listening on port 3000 inside the container, but not exposed outside the container 
```

