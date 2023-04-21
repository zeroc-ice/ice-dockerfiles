#!/bin/bash
set -e

if [ "${1:0:1}" = '-' ]; then
	set -- icegridregistry --Ice.Config=/etc/icegridregistry.conf "$@"
fi

if [ "$1" = "icegridregistry" ]; then
    echo "starting icegridregistry..."
    chown -R ice:ice /var/lib/ice/icegrid
    exec gosu ice "$@"
fi

exec "$@"
