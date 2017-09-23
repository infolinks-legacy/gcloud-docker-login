#!/usr/bin/env bash

set -e

docker build -t infolinks/gcloud-docker-login:${TRAVIS_COMMIT} .

if [[ ${TRAVIS_TAG} =~ ^v[0-9]+$ ]]; then
    docker tag infolinks/gcloud-docker-login:${TRAVIS_COMMIT} infolinks/gcloud-docker-login:${TRAVIS_TAG}
    docker push infolinks/gcloud-docker-login:${TRAVIS_TAG}
    docker tag infolinks/gcloud-docker-login:${TRAVIS_COMMIT} infolinks/gcloud-docker-login:latest
    docker push infolinks/gcloud-docker-login:latest
fi
