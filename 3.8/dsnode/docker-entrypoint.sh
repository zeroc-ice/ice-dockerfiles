#!/bin/bash
set -e

if [ "${1:0:1}" = '-' ]; then
	set -- dsnode "$@"
fi

if [ "$1" = "dsnode" ]; then
    echo "starting dsnode..."
    exec gosu ice "$@"
fi

exec "$@"
