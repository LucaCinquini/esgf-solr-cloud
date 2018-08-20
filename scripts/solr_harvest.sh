#!/bin/bash
# Script to harvest a remote Solr server

set -e

cd /usr/local/esgfpy-publish
python esgfpy/migrate/solr2solr.py --core datasets http://esgf-node.jpl.nasa.gov/solr http://solr-node-1:8983/solr

