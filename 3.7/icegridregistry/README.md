# Supported tags and respective `Dockerfile` links

-   [`latest`, `3.7`, `3.7.0` (*3.7/icegridregistry/Dockerfile*)](https://github.com/zeroc-ice/ice-dockerfiles/blob/master/3.7/icegridregistry/Dockerfile)
-   [`3.6`, `3.6.4` (*3.6/icegridregistry/Dockerfile*)](https://github.com/zeroc-ice/ice-dockerfiles/blob/master/3.6/icegridregistry/Dockerfile)

# What is IceGrid?

[IceGrid](https://zeroc.com/products/ice/services/icegrid) is a location and activation service for [Ice](https://zeroc.com) applications.

# How to use this image

## Start `icegridregistry` service

```
docker run --name some-icegridregistry -v /path/to/config/:/etc/icegridregistry.conf:ro -d zeroc/icegridregistry
```

Refer to the  [IceGrid documentation](https://doc.zeroc.com/display/Ice/IceGrid) for more information on how to configure an IceGrid Registry.

## Data volume

The IceGrid Registry container stores its data in a Docker volume mounted at `/var/lib/ice/icegrid`.

```
docker run --name some-icegridregistry -v /path/to/config:/etc/icegridregistry.conf:ro -v /path/to/folder:/var/lib/ice/icegrid -d zeroc/icegridregistry
```

## Sample Configuration

```
#
# Sample configuration file for the IceGrid registry daemon
#

#
# The IceGrid instance name; must be unique, to distinguish several
# IceGrid deployments
#
IceGrid.InstanceName=DemoIceGrid

#
# Client object adapter: listens on the loopback interface
# IANA-registered TCP ports for the IceGrid registry:
# - 4061 (insecure)
# - 4062 (secure, using SSL)
#
# These endpoints must be accessible to Ice clients and servers as
# well as the IceGrid administrative utilities.
IceGrid.Registry.Client.Endpoints=tcp -p 4061 -h <docker image name>
#IceGrid.Registry.Client.Endpoints=ssl -p 4062 -h <docker image name>
#IceGrid.Registry.Client.Endpoints=tcp -p 4061 -h <docker image name>:ssl -p 4062 -h <docker image name>

#
# Server and Internal object adapters: listens on the loopback
# interface using an OS-assigned port number.
#
# The Server endpoints must be accessible to Ice servers deployed on
# IceGrid nodes or to Ice servers using IceGrid dynamic
# registration. The Internal endpoints must be accessible to IceGrid
# nodes.
#
# Note that access to these endpoints can pose a security
# risk (remote code execution) and therefore these endpoints should be
# secured. See the Ice manual for more information.
#
IceGrid.Registry.Server.Endpoints=tcp -h <docker image name> -p <some port>
IceGrid.Registry.Internal.Endpoints=tcp -h <docker image name> -p <some port>

#
# Authentication/authorization
# With NullPermissionsVerifier, any password is accepted (not recommended
# for production)
#
IceGrid.Registry.PermissionsVerifier=DemoIceGrid/NullPermissionsVerifier
IceGrid.Registry.AdminPermissionsVerifier=DemoIceGrid/NullPermissionsVerifier

#
# Default templates
#
IceGrid.Registry.DefaultTemplates=/usr/share/Ice-3.6.2/templates.xml

#
# Logging to syslog
#
Ice.UseSyslog=1
Ice.ProgramName=icegridregistry (DemoIceGrid Master)
IceGrid.Registry.Trace.Node=1
IceGrid.Registry.Trace.Replica=1
```
