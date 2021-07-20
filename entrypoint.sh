#!/usr/bin/env bash
set -e

if [[ "$1" = 'gulp' ]]; then
    exec "$@"
else
    exec gulp "$@"
fi
