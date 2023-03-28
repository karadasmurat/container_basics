#!/bin/bash 

# Set the image name and container name
IMAGE_NAME=i_static-web
CONTAINER_NAME=c_static-web

# Check if the container is running
if [ "$(docker ps --quiet --filter name=$CONTAINER_NAME)" ]; then
    # Stop and remove the existing container
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

# Build the Docker image
docker build -t $IMAGE_NAME .

# Create and start a new container
docker run --name $CONTAINER_NAME -p 8080:80 -d $IMAGE_NAME