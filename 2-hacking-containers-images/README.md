# Hackers Guide to Customizing Imagess

## Updating the Default NGINX Web Page

### Start the NGINX container

1) Clean up old containers - **explain how**
2) Start an NGINX container on port 8080, in detached mode with a name of hacksite - **explain how**
3) Test the website - **explain how**
4) Use the observability commands from the last set of slides to inspect and get the status of your hacksite
5) Start a new shell process inside your container- **WHAT?**

    ```bash
    docker exec -it hacksite bash
    # shell inside the container
    ```
6) You will get a bash shell from inside the container

    ```bash
    # update the list of available packages for the APT package manager
    apt-get update

    # Install the nano (easy to use) line editor
    apt-get install nano

    # Install process tool
    apt-get install procps

    # list the running processes in the container
    ps -aux
    ```

7) Now list and update the website's default html file

    ```bash
    # List the contents of the default html file
    cat /usr/share/nginx/html/index.html

    # update the html page, write the output (^o)
    nano /usr/share/nginx/html/index.html

    # Exit the container shell process
    exit
    ```

8) Test the modified container URL in your browser using port 8081 - should see the updates
9) See what's changed in containers file system

   ```bash
   # diff of current file system against the original file system 
   docker diff hacksite
   ```

10) Export the modified container as a new image

    ```bash
    # Export the contents of hacksite to a new docker image 
    docker container commit hacksite my-new-image:v1.0

    # List your local Docker images - see your new image
    docker image ls

    # Now run your new image with a new name and on a new port
    docker container run -d -p 8081:80 --name hacksite1.0 my-new-image:v1.0
    ```
