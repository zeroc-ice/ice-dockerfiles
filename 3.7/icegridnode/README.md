# Supported tags and respective `Dockerfile` links

-   [`latest`, `3.7`, `3.7.8` (*3.7/icegridnode/Dockerfile*)](https://github.com/zeroc-ice/ice-dockerfiles/blob/master/3.7/icegridnode/Dockerfile)
-   [`3.6`, `3.6.5` (*3.6/icegridnode/Dockerfile*)](https://github.com/zeroc-ice/ice-dockerfiles/blob/master/3.6/icegridnode/Dockerfile)

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

## Data volume

The IceGrid Node container stores its data in a Docker volume mounted at `/var/lib/ice/icegrid`.
