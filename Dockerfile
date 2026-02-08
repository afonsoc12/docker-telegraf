ARG TELEGRAF_VERSION

FROM telegraf:${TELEGRAF_VERSION}

RUN apt-get update \
    && curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | bash \
    && apt-get install -y --no-install-recommends smartmontools lm-sensors speedtest jq \
    && rm -rf /tmp/* /var/{cache,log}/* /var/lib/apt/lists/*

# Replace original entrypoint.sh
COPY --chmod=0755 entrypoint.sh .
