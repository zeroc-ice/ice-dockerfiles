# Supported tags and respective `Dockerfile` links

- [`latest`, `3.7`, `3.7.10` (*3.7/glacier2/Dockerfile*)](https://github.com/zeroc-ice/ice-dockerfiles/blob/master/3.7/glacier2/Dockerfile)
- [`3.6`, `3.6.5` (*3.6/glacier2/Dockerfile*)](https://github.com/zeroc-ice/ice-dockerfiles/blob/master/3.6/glacier2/Dockerfile)

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

Refer to the  [Glacier2 documentation](https://doc.zeroc.com/display/Ice/Glacier2) for more information on how to configure Glacier2.
