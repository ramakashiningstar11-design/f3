#!/bin/bash

IMAGE_NAME=devops-app
TAG=latest

echo "Building Docker image..."
docker build -t $IMAGE_NAME:$TAG .

if [ $? -eq 0 ]; then
  echo "Docker image built successfully"
else
  echo "Docker build failed"
  exit 1
fi
