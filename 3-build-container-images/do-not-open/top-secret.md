# You just had to look
...but here you are!

## Simple Build

```bash
cd .. #change to the 3-build-container-images folder

# from the root of 3-build-container-images
docker build -t mysite:v1 -f do-not-open/simple.Dockerfile .

docker run -d -p 8080:80 mysite:v1

docker build -t mysite:v2 -f do-not-open/coolsite.Dockerfile .

docker run -d -p 8080:80 mysite:v2
```
