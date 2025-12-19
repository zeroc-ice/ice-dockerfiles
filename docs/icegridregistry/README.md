# Quick reference

- **Maintained by**: [ZeroC, Inc.](https://zeroc.com)

- **Where to get help**: [Ice Discussions](https://github.com/zeroc-ice/ice/discussions)

- **Where to file issues**: [GitHub Issues](https://github.com/zeroc-ice/ice-dockerfiles/issues)

- **Supported architectures**: `amd64`, `arm64` (except for 3.6 which is `amd64` only)

- **Source repository**: [GitHub](https://github.com/zeroc-ice/ice-dockerfiles)

- **Available on**:
  - [Docker Hub](https://hub.docker.com/r/zeroc/icegridregistry): `docker pull zeroc/icegridregistry`
  - [GitHub Container Registry](https://github.com/orgs/zeroc-ice/packages): `docker pull ghcr.io/zeroc-ice/icegridregistry`

# Supported tags and respective `Dockerfile` links

- [`latest`, `3.8`](https://github.com/zeroc-ice/ice-dockerfiles/blob/main/3.8/icegridregistry/Dockerfile)
- [`3.7`](https://github.com/zeroc-ice/ice-dockerfiles/blob/main/3.7/icegridregistry/Dockerfile)
- [`3.6`](https://github.com/zeroc-ice/ice-dockerfiles/blob/main/3.6/icegridregistry/Dockerfile)

# What is IceGrid?

[IceGrid](https://zeroc.com/products/ice/services/icegrid) is a location and activation service for [Ice](https://zeroc.com) applications.

# How to use run image

## Start `icegridregistry` service

Using a configuration file:

```shell
docker run --detach --name some-icegridregistry -v data:/var/lib/ice/icegrid -v /path/to/config/:/etc/icegridregistry.conf:ro zeroc/icegridregistry
```

Using command line arguments:

```shell
docker run --detach --name some-icegridregistry -p 4061:4061 -v data:/var/lib/ice/icegrid zeroc/icegridregistry --IceGrid.Registry.Name=MyRegistry
```

Refer to the  [IceGrid documentation](https://doc.zeroc.com/display/Ice/IceGrid) for more information on how to configure an IceGrid Registry.

# Data volume

The IceGrid Registry container stores its data in a Docker volume mounted at `/var/lib/ice/icegrid`.
