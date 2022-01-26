#!/bin/bash
# login
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $REPO_URI
# build
docker build --platform linux/amd64 -t $CONTAINER_NAME:$TAG .
# tag
docker tag $CONTAINER_NAME:$TAG $REPO_URI:$TAG
# push
docker push $REPO_URI:$TAG