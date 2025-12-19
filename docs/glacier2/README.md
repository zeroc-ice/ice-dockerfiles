# Quick reference

- **Maintained by**: [ZeroC, Inc.](https://zeroc.com)

- **Where to get help**: [Ice Discussions](https://github.com/zeroc-ice/ice/discussions)

- **Where to file issues**: [GitHub Issues](https://github.com/zeroc-ice/ice-dockerfiles/issues)

- **Supported architectures**: `amd64`, `arm64` (except for 3.6 which is `amd64` only)

- **Source repository**: [GitHub](https://github.com/zeroc-ice/ice-dockerfiles)

- **Available on**:
  - [Docker Hub](https://hub.docker.com/r/zeroc/glacier2): `docker pull zeroc/glacier2`
  - [GitHub Container Registry](https://github.com/orgs/zeroc-ice/packages): `docker pull ghcr.io/zeroc-ice/glacier2`

# Supported tags and respective `Dockerfile` links

- [`latest`, `3.8`](https://github.com/zeroc-ice/ice-dockerfiles/blob/main/3.8/glacier2/Dockerfile)
- [`3.7`](https://github.com/zeroc-ice/ice-dockerfiles/blob/main/3.7/glacier2/Dockerfile)
- [`3.6`](https://github.com/zeroc-ice/ice-dockerfiles/blob/main/3.6/glacier2/Dockerfile)

# What is Glacier2?

[Glacier2](https://zeroc.com/products/ice/services/glacier2) allows you to securely route [Ice](https://zeroc.com) communications across networks, such as the public Internet and a private network behind a firewall. With Glacier2, you only need to open one port in your firewall to make multiple back-end Ice servers reachable by remote Ice clients on the Internet. These clients and servers can be on their own local networks behind firewalls and NATs - you don't need to worry about translating addresses and ports as Glacier2 handles all this for you.

# How to use this image

## Start `glacier2` service

Using a configuration file:

```shell
docker run --detach --name glacier2router -p 4063:4063 -v /path/to/config:/etc/glacier2router.conf:ro zeroc/glacier2
```

Using command line arguments:

```shell
docker run --detach --name glacier2router -p 4063:4063 zeroc/glacier2
```

Refer to the  [Glacier2 documentation](https://docs.zeroc.com/ice/3.8/cpp/glacier2) for more information on how to configure Glacier2.
