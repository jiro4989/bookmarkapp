#!/bin/sh

set -eu

CONF_DIR=$1
envsubst '$$ALLOW_ORIGIN $$LISTEN_PORT $$TARGET_PORT' < nginx.conf.tmpl > "$CONF_DIR/nginx.conf"
nginx -g 'daemon off;'
