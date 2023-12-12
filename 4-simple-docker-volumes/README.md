# Quick exercise using a Docker Volumes

## Handy Links

[Docker Storage Manual](https://docs.docker.com/storage/) || [Docker Volume Reference](https://docs.docker.com/engine/reference/commandline/volume_create/)

### Let's create a docker volume

```bash
# Before you start, count how many local docker volumes you have on your laptop
docker volume ls | grep -c local

# Create my local docker volume
docker volume create my-test

# Verify the volume
docker volume ls | grep my-test

# Look at all local volumes
docker volume ls 
```

### Let's use some "throw-away"containers to populate and validate volume data

```bash
# Start an ubuntu container with a command to echo a message to the container's volume directory 
docker run -it --rm -v my-test:/test ubuntu:latest bash -c "echo 'test data for volume' >> /test/somefile.txt"

# Start an apline container to list the file contents
docker run -it --rm -v my-test:/test alpine:latest /bin/sh -c "cat /test/somefile.txt"

# let's mount the volume into and alpine image and list the contents of our file
docker run -it --rm -v my-test:/test alpine cat /test/somefile.txt

# clean up volume
docker volume rm my-test

```
### What if we forget to create the volume before we use it
```bash
# validate the deleted volume
docker volume ls | grep my-test

# One more time, let's mount the missing volume into and alpine image and list the contents in one shot - (expect an error)
docker run -it --rm -v my-test:/test alpine cat /test/somefile.txt

# Is the file missing or the directory? 
docker run -it --rm -v my-test:/test alpine ls -la /

# Where did this come from? I thought we deleted it
docker volume ls | grep my-test

# clean up volume
docker volume rm my-test
```

### Docker Anonymous Volumes

```bash
# Before you start, count how many local docker volumes you have on your laptop
docker volume ls | grep -c local

# What is this Docker command doing
docker run --name my-postgres -e POSTGRES_PASSWORD=verysecretpassword -d postgres:16.1

# After running Postgres the, count how many local docker volumes you have on your laptop
docker volume ls | grep -c local

# Find the new one volume
docker volume ls
```

#### Anonymous Volume Questions

Using Docker Desktop:

1. How can I tell if the volume is associated with my Postgres Container?
2. Why did Docker create this container?
