# Supported tags and respective `Dockerfile` links

-   [`latest`, `3.7`, `3.7.8` (*3.7/icestorm/Dockerfile*)](https://github.com/zeroc-ice/ice-dockerfiles/blob/master/3.7/icestorm/Dockerfile)
-   [`3.6`, `3.6.5` (*3.6/icestorm/Dockerfile*)](https://github.com/zeroc-ice/ice-dockerfiles/blob/master/3.6/icestorm/Dockerfile)

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

## Database volume

The IceStorm container stores its data in a Docker volume mounted at `/data`.
