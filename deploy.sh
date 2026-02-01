#!/bin/bash

IMAGE_NAME=devops-app
TAG=latest
CONTAINER_NAME=devops-container

echo "Stopping existing container (if any)..."
docker stop $CONTAINER_NAME 2>/dev/null
docker rm $CONTAINER_NAME 2>/dev/null

echo "Deploying container..."
docker run -d \
  --name $CONTAINER_NAME \
  -p 80:80 \
  $IMAGE_NAME:$TAG

if [ $? -eq 0 ]; then
  echo "Application deployed successfully"
else
  echo "Deployment failed"
  exit 1
fi
