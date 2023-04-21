# Supported tags and respective `Dockerfile` links

-   [`latest`, `3.7`, `3.7.8` (*3.7/icegridregistry/Dockerfile*)](https://github.com/zeroc-ice/ice-dockerfiles/blob/master/3.7/icegridregistry/Dockerfile)
-   [`3.6`, `3.6.5` (*3.6/icegridregistry/Dockerfile*)](https://github.com/zeroc-ice/ice-dockerfiles/blob/master/3.6/icegridregistry/Dockerfile)
## What is IceGrid?

[IceGrid](https://zeroc.com/products/ice/services/icegrid) is a location and activation service for [Ice](https://zeroc.com) applications.
## How to use this image
### Start `icegridregistry` service

Using a configuration file:

```shell
docker run --detach --name some-icegridregistry -v data:/var/lib/ice/icegrid -v /path/to/config/:/etc/icegridregistry.conf:ro zeroc/icegridregistry
```

Using command line arguments:

```shell
docker run --detach --name some-icegridregistry -p 4061:4061 -v data:/var/lib/ice/icegrid zeroc/icegridregistry --IceGrid.Registry.Name=MyRegistry
```

Refer to the  [IceGrid documentation](https://doc.zeroc.com/display/Ice/IceGrid) for more information on how to configure an IceGrid Registry.
### Data volume

The IceGrid Registry container stores its data in a Docker volume mounted at `/var/lib/ice/icegrid`.
