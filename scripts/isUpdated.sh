#!/bin/bash

function retrieve_latest_image () {
    image=$1
    local version=$(curl -s \
                -H "Accept: application/json" \
                https://hub.docker.com/v2/repositories/$image/tags | \
                    jq -r '.["results"][]["name"]' | \
                    grep -Po '(\d+\.)?(\d+\.)?(\*|\d+)$' | \
                    sort -n -r | \
                    head -n1)
    echo $version
}

ext_tag=$(retrieve_latest_image 'library/telegraf')

echo "**** External release is $ext_tag"

last_tag=$(retrieve_latest_image 'afonsoc12/telegraf')

echo "**** Last release is $ext_tag"

if [ -z "${ext_tag}" ] || [ "${ext_tag}" == "null" ]; then
    echo "**** Can't retrieve external release, exiting... ****"
    exit 1
elif [ -z "${last_tag}" ]; then
    echo "**** Can't retrieve last release, exiting... ****"
    exit 1
elif [ "$ext_tag" == "$last_tag" ]; then
    echo "**** Current release is still up-to-date ****"
    echo "    - Telegraf version:  $ext_tag"
    echo "    - Last release version: $last_tag"
else
    version_file="DOCKER_VERSION.txt"
    echo "**** Triggering new release by creating the file: $version_file ****"
    echo "    Old version: $last_tag"
    echo "    NEW version: $ext_tag"
    echo $ext_tag > $version_file
fi
