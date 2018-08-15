#!/bin/bash
# Script to initialize Solr collections at startup

set -e

# wait for Solr to be available
/opt/docker-solr/scripts/wait-for-solr.sh --solr-url "http://${SOLR_HOST}:${SOLR_PORT}"

# create collections, if not existing already
for collection in "datasets" "files" "aggregations"
do
  # try querying this collection to see if it exists
  if ( curl "http://${SOLR_HOST}:${SOLR_PORT}/solr/admin/collections?action=LIST&wt=json" | grep "${collection}" ); then
  	 echo "Collection ${collection} already exists"
  else
    curl "http://${SOLR_HOST}:${SOLR_PORT}/solr/admin/collections?action=CREATE&name=${collection}&numShards=${SOLR_NUM_SHARDS}&replicationFactor=${SOLR_NUM_REPLICAS}&maxShardsPerNode=${SOLR_MAX_SHARDS_PER_NODE}"
    curl "http://${SOLR_HOST}:${SOLR_PORT}/solr/${collection}/config" -d '{"set-user-property": {"update.autoCreateFields":"false"}}'
  fi
done

# upload configuration
/opt/solr/bin/solr zk upconfig -z ${ZOOKEEPER_HOST}:${ZOOKEEPER_PORT} -n datasets -d /esgf/config/solr-home/datasets
