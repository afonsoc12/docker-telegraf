#!/bin/bash

# Check exiting tools
echo "curl: $(curl --version)"
echo "grep: $(grep --version)"
echo "jq: $(jq --version)"
echo "sort: $(sort --version)"
echo "head: $(head --version)"

echo $(curl -s \
                -H "Accept: application/json" \
                https://hub.docker.com/v2/repositories/library/telegraf/tags | \
                    jq -r '.["results"][]["name"]' | \
                    grep -E '^(\d+\.)?(\d+\.)?(\*|\d+)$' | \
                    sort -n -r | \
                    head -n1)

echo $(curl -s \
                -H "Accept: application/json" \
                https://hub.docker.com/v2/repositories/library/telegraf/tags | \
                    jq -r '.["results"][]["name"]')
echo $(curl -s \
                -H "Accept: application/json" \
                https://hub.docker.com/v2/repositories/library/telegraf/tags | \
                    jq -r '.["results"][]["name"]' | \
                    grep -E '^(\d+\.)?(\d+\.)?(\*|\d+)$')

echo $(curl -s \
                -H "Accept: application/json" \
                https://hub.docker.com/v2/repositories/library/telegraf/tags | \
                    jq -r '.["results"][]["name"]' | \
                    grep -E '^(\d+\.)?(\d+\.)?(\*|\d+)$' | \
                    sort -n -r)

echo $(curl -s \
                -H "Accept: application/json" \
                https://hub.docker.com/v2/repositories/library/telegraf/tags | \
                    jq -r '.["results"][]["name"]' | \
                    grep -E '^(\d+\.)?(\d+\.)?(\*|\d+)$' | \
                    sort -n -r | \
                    head -n1)
echo "=============="

a=$(curl -s \
                -H "Accept: application/json" \
                https://hub.docker.com/v2/repositories/library/telegraf/tags | \
                    jq -r '.["results"][]["name"]' | \
                    grep -E '^(\d+\.)?(\d+\.)?(\*|\d+)$' | \
                    sort -n -r | \
                    head -n1)

b=$(curl -s \
                -H "Accept: application/json" \
                https://hub.docker.com/v2/repositories/library/telegraf/tags | \
                    jq -r '.["results"][]["name"]')
c=$(curl -s \
                -H "Accept: application/json" \
                https://hub.docker.com/v2/repositories/library/telegraf/tags | \
                    jq -r '.["results"][]["name"]' | \
                    grep -E '^(\d+\.)?(\d+\.)?(\*|\d+)$')

d=$(curl -s \
                -H "Accept: application/json" \
                https://hub.docker.com/v2/repositories/library/telegraf/tags | \
                    jq -r '.["results"][]["name"]' | \
                    grep -E '^(\d+\.)?(\d+\.)?(\*|\d+)$' | \
                    sort -n -r)

e=$(curl -s \
                -H "Accept: application/json" \
                https://hub.docker.com/v2/repositories/library/telegraf/tags | \
                    jq -r '.["results"][]["name"]' | \
                    grep -E '^(\d+\.)?(\d+\.)?(\*|\d+)$' | \
                    sort -n -r | \
                    head -n1)

echo $a
echo $b
echo $c
echo $d
echo $e

echo "+++++++++++"
function retrieve_latest_image () {
    image=$1
    local version=$(curl -s \
                -H "Accept: application/json" \
                https://hub.docker.com/v2/repositories/$image/tags | \
                    jq -r '.["results"][]["name"]' | \
                    grep -E '^(\d+\.)?(\d+\.)?(\*|\d+)$' | \
                    sort -n -r | \
                    head -n1)
    echo $version
}

a=$(curl -s \
                -H "Accept: application/json" \
                https://hub.docker.com/v2/repositories/library/telegraf/tags | \
                    jq -r '.["results"][]["name"]' | \
                    grep -E '^(\d+\.)?(\d+\.)?(\*|\d+)$' | \
                    sort -n -r | \
                    head -n1)

b=$(curl -s \
                -H "Accept: application/json" \
                https://hub.docker.com/v2/repositories/library/telegraf/tags | \
                    jq -r '.["results"][]["name"]')
c=$(curl -s \
                -H "Accept: application/json" \
                https://hub.docker.com/v2/repositories/library/telegraf/tags | \
                    jq -r '.["results"][]["name"]' | \
                    grep -E '^(\d+\.)?(\d+\.)?(\*|\d+)$')

d=$(curl -s \
                -H "Accept: application/json" \
                https://hub.docker.com/v2/repositories/library/telegraf/tags | \
                    jq -r '.["results"][]["name"]' | \
                    grep -E '^(\d+\.)?(\d+\.)?(\*|\d+)$' | \
                    sort -n -r)

e=$(curl -s \
                -H "Accept: application/json" \
                https://hub.docker.com/v2/repositories/library/telegraf/tags | \
                    jq -r '.["results"][]["name"]' | \
                    grep -E '^(\d+\.)?(\d+\.)?(\*|\d+)$' | \
                    sort -n -r | \
                    head -n1)

echo $a
echo $b
echo $c
echo $d
echo $e
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
