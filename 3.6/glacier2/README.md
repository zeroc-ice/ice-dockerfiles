# Supported tags and respective `Dockerfile` links

-   [`latest`, `3.6`, `3.6.2` (*3.6/glacier2/Dockerfile*)](https://github.com/zeroc-ice/ice-dockerfiles/blob/master/3.6/glacier2/Dockerfile)


# What is Glacier2?

A Glacier2 router allows you to securely route [Ice](https://zeroc.com) communications across networks, such as the public Internet and a private network behind a firewall. With Glacier2, you only need to open one port in your firewall to make multiple back-end Ice servers reachable by remote Ice clients on the Internet. These clients and servers can be on their own local networks behind firewalls and NATs - you don't need to worry about translating addresses and ports as Glacier2 handles all this for you.

# How to use this image

## Start `glacier2` service

```
docker run --name some-glacier2 -v /path/to/config:/etc/glacier2router.conf:ro -d zeroc/glacier2
```

Refer to the  [Glacier2 documentation](https://doc.zeroc.com/display/Ice/Glacier2) for more information on how to configure Glacier2.

## Exposing ports

```
docker run --name some-glacier2 -p 4064:4064 -v /path/to/config:/etc/glacier2router.conf:ro -d zeroc/glacier2
```

## Sample Configuration

```
#
# Set the instance name
#
Glacier2.InstanceName=MyGlacier2Router

#
# The client-visible endpoint of Glacier2. This should be an endpoint
# visible from the public Internet, and it should be secure.
# IANA-registered TCP ports for the Glacier2 router:
# - 4063 (insecure)
# - 4064 (secure, using SSL)
#
# Using tcp is not recommended for production!
#
Glacier2.Client.Endpoints=tcp -p 4063 -h localhost
#Glacier2.Client.Endpoints=ssl -p 4064 -h localhost

Glacier2.Client.PublishedEndpoints=tcp -p 4063 -h <docker host ip>
#Glacier2.Client.PublishedEndpoints=ssl -p 4064 -h <docker host ip>
#
# The server-visible endpoint of Glacier2. This endpoint is only
# required if callbacks are needed (leave empty otherwise). This
# should be an endpoint on an internal network (like 192.168.x.x), or
# on the loopback, so that the server is not directly accessible from
# the Internet.
#
Glacier2.Server.Endpoints=tcp -h localhost -p <some port>
Glacier2.Server.PublishedEntpoints=tcp -h <docker host ip> -p <some port>

#
# This permissions verifier allows any user-id / password combination;
# this is not recommended for production!
#
Glacier2.PermissionsVerifier=MyGlacier2Router/NullPermissionsVerifier

#
# The timeout for inactive sessions. If any client session is inactive
# for longer than this value, the session expires and is removed. The
# unit is seconds.
#
Glacier2.SessionTimeout=30

#
# Glacier2 always disables active connection management so there is no
# need to configure this manually. Connection retry does not need to
# be disabled, as it's safe for Glacier2 to retry outgoing connections
# to servers. Retry for incoming connections from clients must be
# disabled in the clients.
#

#
# Various settings to trace requests, overrides, etc.
#
Ice.UseSyslog=1
Glacier2.Client.Trace.Request=1
Glacier2.Server.Trace.Request=1
Glacier2.Client.Trace.Override=1
Glacier2.Server.Trace.Override=1
Glacier2.Client.Trace.Reject=1
Glacier2.Trace.Session=1
Glacier2.Trace.RoutingTable=1

#
# Warn about connection exceptions
#
Ice.Warn.Connections=1

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
# Protocol Tracing
#
# 0 = no protocol tracing
# 1 = trace protocol messages
#
#Ice.Trace.Protocol=1

#
# Security Tracing
#
# 0 = no security tracing
# 1 = trace messages
#
#IceSSL.Trace.Security=1

#
# SSL Configuration
#
#Ice.Plugin.IceSSL=IceSSL:createIceSSL

#IceSSL.DefaultDir=<path to certs dir>

#IceSSL.CertAuthFile=cacert.pem
#IceSSL.CertFile=server.p12
```
