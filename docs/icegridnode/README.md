# Quick reference

- **Maintained by**: [ZeroC, Inc.](https://zeroc.com)

- **Where to get help**: [Ice Discussions](https://github.com/zeroc-ice/ice/discussions)

- **Where to file issues**: [GitHub Issues](https://github.com/zeroc-ice/ice-dockerfiles/issues)

- **Supported architectures**: `amd64`, `arm64` (except for 3.6 which is `amd64` only)

- **Source repository**: [GitHub](https://github.com/zeroc-ice/ice-dockerfiles)

- **Available on**:
  - [Docker Hub](https://hub.docker.com/r/zeroc/icegridnode): `docker pull zeroc/icegridnode`
  - [GitHub Container Registry](https://github.com/orgs/zeroc-ice/packages): `docker pull ghcr.io/zeroc-ice/icegridnode`

# Supported tags and respective `Dockerfile` links

- [`latest`, `3.8`](https://github.com/zeroc-ice/ice-dockerfiles/blob/main/3.8/icegridnode/Dockerfile)
- [`3.7`](https://github.com/zeroc-ice/ice-dockerfiles/blob/main/3.7/icegridnode/Dockerfile)
- [`3.6`](https://github.com/zeroc-ice/ice-dockerfiles/blob/main/3.6/icegridnode/Dockerfile)

# What is IceGrid?

[IceGrid](https://zeroc.com/products/ice/services/icegrid) is a location and activation service for [Ice](https://zeroc.com) applications.

# How to use this image

## Start `icegridnode` service

Using a configuration file:

```shell
docker run --detach --name some-icegridnode -v data:/var/lib/ice/icegrid -v /path/to/config/:/etc/icegridnode.conf:ro zeroc/icegridnode
```

Using command line arguments:

```shell
docker run --detach --name some-icegridnode zeroc/icegridnode -v data:/var/lib/ice/icegrid --IceGrid.Node.Name=MyNode --Ice.Default.Locator="IceGrid/Locator:tcp -h icegridregistry -p 4061"
```

Refer to the  [IceGrid documentation](https://doc.zeroc.com/display/Ice/IceGrid) for more information on how to configure an IceGrid Node.

# Data volume

The IceGrid Node container stores its data in a Docker volume mounted at `/var/lib/ice/icegrid`.
