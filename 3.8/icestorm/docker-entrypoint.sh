#!/bin/bash
set -e

[ -e /data ] || mkdir /data

if [ "${1:0:1}" = '-' ]; then
	set -- icebox --IceBox.Service.IceStorm=IceStormService,38:createIceStorm --IceStorm.LMDB.Path=/data "$@"
fi

if [ "$1" = "icebox" ]; then
    echo "starting icestorm..."
    chown -R ice:ice /data
    exec gosu ice "$@"
fi

exec "$@"
