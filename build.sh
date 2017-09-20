#!/bin/sh
set -o errexit

REGISTRY="registry.telecomsante.com:5000"
# REGISTRY="localhost"
# VERSION="$(git describe --exact-match 2> /dev/null || git rev-parse --short HEAD)"
# VERSION=$(echo ${VERSION} | sed 's/^v//')
VERSION=1.0.0
PRODUCT="dev/indi/stresstests"

docker build . \
  -t ${REGISTRY}/${PRODUCT}:${VERSION} \
  --build-arg version=${VERSION} \
  --build-arg product=${PRODUCT}

echo "image created -> ${REGISTRY}/${PRODUCT}:${VERSION}"
