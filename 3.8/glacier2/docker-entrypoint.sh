#!/bin/bash
set -e

if [ "${1:0:1}" = '-' ]; then
	set -- glacier2router --Ice.Config=/etc/glacier2router.conf "$@"
fi

if [ "$1" = "glacier2router" ]; then
    echo "starting Glacier2 router..."
    exec gosu ice "$@"
fi

exec "$@"
