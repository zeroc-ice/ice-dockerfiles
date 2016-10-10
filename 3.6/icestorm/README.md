# Supported tags and respective `Dockerfile` links

-   [`latest`, `3.6`, `3.6.3` (*3.6/icestorm/Dockerfile*)](https://github.com/zeroc-ice/ice-dockerfiles/blob/master/3.6/icestorm/Dockerfile)


# What is IceStorm?

[IceStorm](https://zeroc.com/products/ice/services/icestorm) is a publish-subscribe event distribution service that helps you create push applications using the [Ice](https://zeroc.com) RPC framework.

# How to use this image

## Start `icestorm` service

```
docker run --name some-icestorm -v /path/to/config:/etc/icestorm.conf:ro -d zeroc/icestorm
```

Refer to the  [IceStorm documentation](https://doc.zeroc.com/display/Ice/IceStorm) for more information on how to configure IceStorm.

## Database volume

The IceStorm container stores its data in a Docker volume mounted at `/data`.

```
docker run --name some-icestorm -v /path/to/config:/etc/icestorm.conf:ro -v/path/to/folder:/data -d zeroc/icestorm
```

## Sample Configuration

```
#
# The IceStorm service instance name.
#
IceStorm.InstanceName=MyIceStorm

#
# This property defines the endpoints on which the IceStorm
# TopicManager listens.
#
IceStorm.TopicManager.Endpoints=tcp -h <docker image name> -p 10000

#
# This property defines the endpoints on which the topic
# publisher objects listen. If you want to federate
# IceStorm instances this must run on a fixed port (or use
# IceGrid).
#
IceStorm.Publish.Endpoints=tcp -h <docker image name> -p 10001:udp -h <docker image name> -p 10001
#
# TopicManager Tracing
#
# 0 = no tracing
# 1 = trace topic creation, subscription, unsubscription
# 2 = like 1, but with more detailed subscription information
#
IceStorm.Trace.TopicManager=2

#
# Topic Tracing
#
# 0 = no tracing
# 1 = trace unsubscription diagnostics
# 2 = like 1, but with more detailed subscription information
#
IceStorm.Trace.Topic=1

#
# Subscriber Tracing
#
# 0 = no tracing
# 1 = subscriber diagnostics (subscription, unsubscription, event
#     propagation failures)
# 2 = like 1, but with more detailed subscription information
#
IceStorm.Trace.Subscriber=1

#
# Amount of time in milliseconds between flushes for batch mode
# transfer. The minimum allowable value is 100ms.
#
IceStorm.Flush.Timeout=2000

#
# Network Tracing
#
# 0 = no network tracing
# 1 = trace connection establishment and closure
# 2 = like 1, but more detailed
# 3 = like 2, but also trace data transfer
#
#Ice.Trace.Network=1

#
# IceMX configuration.
#
#Ice.Admin.Endpoints=tcp -h <docker image name> -p 10004
Ice.Admin.InstanceName=icestorm
IceMX.Metrics.Debug.GroupBy=id
IceMX.Metrics.ByParent.GroupBy=parent
```
