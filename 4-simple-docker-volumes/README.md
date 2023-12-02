# Quick exercise using a Docker Volumes

### Handy Links

[Docker Storage Manual](https://docs.docker.com/storage/) || [Docker Volume Reference](https://docs.docker.com/engine/reference/commandline/volume_create/)

```bash
# create my local docker volume
docker volume create my-test

# verify the volume
docker volume ls | grep my-test

# look at all local volumes
docker volume ls 

# we mount the volume into a generic ubuntu container and add some data
docker run -it --rm -v my-test:/test ubuntu bash
cd test
echo "test data for volume" > my-test-file.txt
cat my-test-file.txt
exit

# let's lake sure the container is gone along with COW file system
docker ps -a

# let's mount the volume into and alpine image and list the contents in one shot
docker run -it --rm -v my-test:/test alpine cat /test/my-test-file.txt

# clean up volume
docker volume rm my-test

# validate the deleted volume
docker volume ls | grep my-test

# One more time let's mount the volume into and alpine image and list the contents in one shot
docker run -it --rm -v my-test:/test alpine cat /test/my-test-file.txt

# is the directory there?
docker run -it --rm -v my-test:/test alpine ls -la /test

# Where did this come from? I thought we deleted it
docker volume ls | grep my-test
```
