#!/bin/bash
set -e

if [ "${1:0:1}" = '-' ]; then
    set -- icegridnode --Ice.Config=/etc/icegridnode.conf "$@"
fi

if [ "$1" = "icegridnode" ]; then
    echo "starting icegridnode..."
    chown -R ice:ice /var/lib/ice/icegrid
    exec gosu ice "$@"
fi

exec "$@"
