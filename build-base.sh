#!/bin/sh

. ./VERSION

docker build -t devbox:$VERSION - < Dockerfile.base
