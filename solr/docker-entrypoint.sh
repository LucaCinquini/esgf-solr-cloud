#!/bin/bash

set -e

# Make sure SOLR_HOME is set and has the correct permissions
[ -z "$SOLR_HOME" ] && { echo "[ERROR] SOLR_HOME must be set" 1>&2 ; exit 1; }
chown -R "$SOLR_USER":"$SOLR_GROUP" "$SOLR_HOME"
chmod -R 700 "$SOLR_HOME"

# Start Solr as "solr" user with the specified parameters
echo "[INFO] Running '$@'"
exec gosu "$SOLR_USER" /opt/docker-solr/scripts/docker-entrypoint.sh "$@"
