#!/usr/bin/env bash

# obtain GCP service account JSON contents from environment variable
if [[ -z "${GCP_SA_JSON}" ]]; then
    echo "please provide the 'GCP_SA_JSON' environment variable" >&2
    echo "example: docker run -e GCP_SA_JSON=\$(cat my-sa-key.json) infolinks/gcloud-docker-login > ~/.dockercfg" >&2
    exit 1
fi

# fail on first failure
set -e

# store it in a temporary file
GCP_SA_JSON_FILE="/tmp/gcp_service_account.json"
echo -nE "${GCP_SA_JSON}" > ${GCP_SA_JSON_FILE}

# activate the service account
gcloud auth activate-service-account --key-file=${GCP_SA_JSON_FILE}

# perform Docker login to GCR
gcloud docker --authorize-only

# print the contents of '.dockercfg'
# the intended usage of this image is invoking it and saving its output into the host's dockercfg file
cat ~/.dockercfg
