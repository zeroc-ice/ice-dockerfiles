# Quick reference

- **Maintained by**: [ZeroC, Inc.](https://zeroc.com)

- **Where to get help**: [Ice Discussions](https://github.com/zeroc-ice/ice/discussions)

- **Where to file issues**: [GitHub Issues](https://github.com/zeroc-ice/ice-dockerfiles/issues)

- **Supported architectures**: `amd64`, `arm64`

- **Source repository**: [GitHub](https://github.com/zeroc-ice/ice-dockerfiles)

- **Available on**:
  - [Docker Hub](https://hub.docker.com/r/zeroc/dsnode): `docker pull zeroc/dsnode`
  - [GitHub Container Registry](https://github.com/orgs/zeroc-ice/packages): `docker pull ghcr.io/zeroc-ice/dsnode`

# Supported tags and respective `Dockerfile` links

- [`latest`, `3.8`](https://github.com/zeroc-ice/ice-dockerfiles/blob/main/3.8/dsnode/Dockerfile)

# What is DataStorm Node?

[DataStorm](https://docs.zeroc.com/ice/3.8/cpp/datastorm) is a high-performance publish/subscribe and data distribution service built on [Ice](https://zeroc.com). The DataStorm Node (`dsnode`) participates in a DataStorm mesh by accepting connections from other nodes and forwarding topic discovery and data updates.

See the [DataStorm.Node.* property reference](https://docs.zeroc.com/ice/3.8/cpp/datastorm-node) for all available settings.

# How to use this image

## Start `dsnode` service

Using a configuration file:

```shell
docker run --detach --name dsnode -v /path/to/config:/etc/dsnode.conf:ro zeroc/dsnode
```

Using command line arguments:

```shell
docker run --detach --name dsnode zeroc/dsnode \
  --DataStorm.Node.Server.Endpoints="tcp -p 4061"
```

Since Docker networks do not generally support multicast, the `DataStorm.Node.Server.Endpoints` property is required.

Refer to the [DataStorm documentation](https://docs.zeroc.com/ice/3.8/cpp/datastorm) and the [DataStorm.Node.* property reference](https://docs.zeroc.com/ice/3.8/cpp/datastorm-node) for more information on how to configure a DataStorm Node.
