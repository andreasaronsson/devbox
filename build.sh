#!/bin/sh

export USER_ID
USER_ID=$(id -u)
TAG=devbox-$USER
envsubst <Dockerfile | docker build -t "$TAG" -
