#!/bin/sh

TAG=devbox-$USER
VOLUMES="-v /tmp/.X11-unix:/tmp/.X11-unix -v /var/run/docker.sock:/var/run/docker.sock -v $HOME:${HOME}"
ENVVARS="-e UID=$UID -e DISPLAY=$DISPLAY -e TERM=$TERM"
PORTS="-p 127.0.0.1:2375:2375"
CMD="ssh-agent /bin/bash"

# shellcheck disable=SC2086
docker run --rm -i $ENVVARS $VOLUMES $PORTS -w "$HOME" --net="host" -t "$TAG" $CMD

# TODO: Use the env variables instead of socket. This will make is possible to use this devbox on more OSs
# -e "DOCKER_HOST=$DOCKER_HOST" -e "DOCKER_TLS_VERIFY=$DOCKER_TLS_VERIFY" -e "DOCKER_CERT_PATH=/docker-certs" -v "$DOCKER_CERT_PATH:/docker-certs"
