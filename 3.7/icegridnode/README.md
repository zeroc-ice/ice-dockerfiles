# Supported tags and respective `Dockerfile` links

-   [`latest`, `3.7`, `3.7.7` (*3.7/icegridnode/Dockerfile*)](https://github.com/zeroc-ice/ice-dockerfiles/blob/master/3.7/icegridnode/Dockerfile)
-   [`3.6`, `3.6.5` (*3.6/icegridnode/Dockerfile*)](https://github.com/zeroc-ice/ice-dockerfiles/blob/master/3.6/icegridnode/Dockerfile)

# What is IceGrid?

[IceGrid](https://zeroc.com/products/ice/services/icegrid) is a location and activation service for [Ice](https://zeroc.com) applications.

# How to use this image

## Start `icegridnode` service

```
docker run --name some-icegridnode -v /path/to/config/:/etc/icegridnode.conf:ro -d zeroc/icegridnode
```

Refer to the  [IceGrid documentation](https://doc.zeroc.com/display/Ice/IceGrid) for more information on how to configure an IceGrid Node.

## Data volume

The IceGrid Node container stores its data in a Docker volume mounted at `/var/lib/ice/icegrid`.

```
docker run --name some-icegridnode -v /path/to/config:/etc/icegridnode.conf:ro -v /path/to/folder:/var/lib/ice/icegrid -d zeroc/icegridnode
```

## Sample Configuration

```
#
# Sample configuration file for the IceGrid node daemon
#

#
# Proxy to the IceGrid registry
#
Ice.Default.Locator=DemoIceGrid/Locator:tcp -h <docker icegrid registry name>  -p 4061
#Ice.Default.Locator=DemoIceGrid/Locator:ssl -h <docker icegrid registry name>  -p 4062

#
# The name of this node; must be unique within an IceGrid deployment
#
IceGrid.Node.Name=node1

#
# The node object adapter listens on the loopback interface using an
# OS-assigned port
#
# These endpoints must be accessible to IceGrid registries.
#
# Note that access to these endpoints can pose a security
# risk (remote code execution) and therefore these endpoints should be
# secured. See the Ice manual for more information.
#
IceGrid.Node.Endpoints=tcp -h <docker image name> -p <some port>

#
# Redirect the servers'stdout and stderr to files in this directory:
#
IceGrid.Node.Output=/var/lib/ice/icegrid
#IceGrid.Node.RedirectErrToOut=1

#
# Logging to syslog
#
Ice.UseSyslog=1
Ice.ProgramName=icegridnode (DemoIceGrid node1)
IceGrid.Node.Trace.Replica=2
```
