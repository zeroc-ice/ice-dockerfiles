# Quick reference

- **Maintained by**: [ZeroC, Inc.](https://zeroc.com)

- **Where to get help**: [Ice Discussions](https://github.com/zeroc-ice/ice/discussions)

- **Where to file issues**: [GitHub Issues](https://github.com/zeroc-ice/ice-dockerfiles/issues)

- **Supported architectures**: `amd64`, `arm64` (except for 3.6 which is `amd64` only)

- **Source repository**: [GitHub](https://github.com/zeroc-ice/ice-dockerfiles)

- **Available on**:
  - [Docker Hub](https://hub.docker.com/r/zeroc/icestorm): `docker pull zeroc/icestorm`
  - [GitHub Container Registry](https://github.com/orgs/zeroc-ice/packages): `docker pull ghcr.io/zeroc-ice/icestorm`

# Supported tags and respective `Dockerfile` links

- [`latest`, `3.8`](https://github.com/zeroc-ice/ice-dockerfiles/blob/main/3.8/icestorm/Dockerfile)
- [`3.7`](https://github.com/zeroc-ice/ice-dockerfiles/blob/main/3.7/icestorm/Dockerfile)
- [`3.6`](https://github.com/zeroc-ice/ice-dockerfiles/blob/main/3.6/icestorm/Dockerfile)

# What is IceStorm?

[IceStorm](https://zeroc.com/products/ice/services/icestorm) is a publish-subscribe event distribution service that helps you create push applications using the [Ice](https://zeroc.com) RPC framework.

# How to use this image

## Start `icestorm` service

From a configuration file:

```shell
docker run --detach --name some-icestorm -v /path/to/config:/etc/icestorm.conf:ro zeroc/icestorm
```

From command line arguments:

```shell
docker run --detach --name some-icestorm zeroc/icestorm --IceStorm.TopicManager.Endpoints="tcp -h 0.0.0.0 -p 9999" --IceStorm.Publish.Endpoints="tcp -h 0.0.0.0 -p 10000"
```

Refer to the  [IceStorm documentation](https://doc.zeroc.com/display/Ice/IceStorm) for more information on how to configure IceStorm.

# Data volume

The IceStorm container stores its data in a Docker volume mounted at `/data`.
