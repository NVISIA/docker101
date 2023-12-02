# Using a Bind Mount to Run Cool Website

## Create simple a nginx Dockerfile

### Helpful links

[Docker Run with a bind mount](https://docs.docker.com/engine/reference/commandline/run/#volume) || [Dockerfile Reference](https://docs.docker.com/engine/reference/builder/) 

### Use the docker image using the nginx base image

Review the simple Dockerfile from lab 3 (Dockerfile in this folder)

### Build your image

Use the docker build command to create cool-webiste:v1 image

### Run the image, mounting the local website folder into the correct mount point in the container

Using the information from lesson 3 and the docker run command reference, run your cool-website:v1 container, passing on the local folder as the source and the container mount point as the target.
...don't forget to expose the container ports when running the website.

### Update the website, save changes locally and refresh the page

... notice how short the feed back loop is!

## End of lab
