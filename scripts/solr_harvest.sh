#!/bin/bash

# Script to harvest a remote Solr server
# Uses env variables SOLR_SOURCE_URL and SOLR_TARGET_URL

set -e

cd /usr/local/esgfpy-publish

# loop over collections
for collection in "datasets" "files" "aggregations"
do
  python esgfpy/migrate/solr2solr.py --core ${collection} ${SOLR_SOURCE_URL} ${SOLR_TARGET_URL} --max 1000
done
