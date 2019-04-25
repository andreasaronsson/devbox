#!/bin/sh

. ./VERSION

docker tag devbox:$VERSION <docker_registry>/devbox:$VERSION
docker push <docker_registry>/devbox:$VERSION
