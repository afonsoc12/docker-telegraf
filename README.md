# Docker telegraf

[![Docker Pulls](https://img.shields.io/docker/pulls/afonsoc12/telegraf?logo=docker)](https://hub.docker.com/repository/docker/afonsoc12/telegraf) 
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

[![Github Starts](https://img.shields.io/github/stars/afonsoc12/docker-telegraf?logo=github)](https://github.com/afonsoc12/docker-telegraf)
[![Github Fork](https://img.shields.io/github/forks/afonsoc12/docker-telegraf?logo=github)](https://github.com/afonsoc12/docker-telegraf)
[![Github Release](https://img.shields.io/github/v/release/afonsoc12/docker-telegraf?logo=github)](https://github.com/afonsoc12/docker-telegraf/releases)

[telegraf](https://www.influxdata.com/time-series-platform/telegraf) is *"an agent for collecting metrics and writing them to InfluxDB or other outputs"*. 

This repository automatically builds and pushes docker images for the latest releases of [telegraf](https://hub.docker.com/_/telegraf) official docker image, extending them with sivel's [speedtest-cli](https://github.com/sivel/speedtest-cli), in both `linux/amd64` and `linux/arm64` architectures.

# Instalation

The image can be pulled from both [DockerHub](https://hub.docker.com/r/afonsoc12/telegraf) and [ghcr.io](https://github.com/afonsoc12/docker-telegraf/pkgs/container/telegraf) container registries.

```shell
# You can also specify a version as the tag, such as afonsoc12/telegraf:1.20.4
docker pull afonsoc12/telegraf:latest
```

The commands for this image are the same as the official image, e.g., to generate a sample configuration and save it on the host:

```shell
docker run --rm afonsoc12/telegraf:latest telegraf config > telegraf.conf
```

In addition, this image is extended with speedtest-cli so that it is available to telegraf. To test it out:

```shell
docker run --rm afonsoc12/telegraf:latest speedtest-cli
```

Please consult [the official documentation](https://hub.docker.com/_/telegraf) on telegraf's repository.


## Credits

Copyright 2022 Afonso Costa

Licensed under the [Apache License, Version 2.0](https://github.com/afonsoc12/docker-telegraf/blob/master/LICENSE) (the "License")
