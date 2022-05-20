ARG TELEGRAF_VERSION

FROM telegraf:${TELEGRAF_VERSION}

RUN apt-get update \
    && apt-get install -y --no-install-recommends python \
    && wget -O speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py \
    && mv speedtest-cli /usr/bin/speedtest-cli \
    && chmod +x /usr/bin/speedtest-cli