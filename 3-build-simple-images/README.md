# Building Docker Containers the Right Way

## Using a Dockerfile

### Helpful links

[Docker Build Overview Docs](https://docs.docker.com/build/) || [Dockerfile Reference](https://docs.docker.com/engine/reference/builder/) || [Docker Hub Official Images](https://hub.docker.com/search?q=&image_filter=official)

## Create a docker image using the nginx base image

### Group Activity: Find and official Docker base image for nginx

Open Docker Hub in a Browser: [Docker Hub](https://hub.docker.com/)

- Explore
  - Check Official images
- Find the nginx repo
- review tags, architecture, image size and vulnerabilities
- Tags
  - Search Tags for alpine
  - 3.18 slim
  - Pull the image to your local image cache

### Create and test a simple image using a Dockerfile

- Create a Dockerfile that uses the base image: nginx:mainline-alpine3.18-slim 
- use docker build to create an image called mysite with a v1 tag
- run the container using your new image on local port 8088
  - need to find the container port
- View the default page in your browser and from the command line

### Use your container to host the website in the container

- Update the Dockerfile
- During the build, copy the cool-website-source folder into the nginx image's HTML folder (/usr/share/nginx/html)
- Rebuild and test the container - you might have to reload the webpage

### Update the Website

- Go into the cool-website-source folder and update the banner message in the index file
- Rebuild and test the container - you might have to reload the webpage

## End of lab

### While you are waiting make addition updates and customize to the website

#### make changes, rebuild with a new version tag and run the container

- What challenges do have>
- What should we automate to improve the developer experience?