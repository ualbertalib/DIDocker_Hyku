#!/bin/bash

echo "Cleaning tmp directory"
rm -rf /data/tmp/*

echo "Starting Solr..."
/usr/local/bin/start_solr.sh &

echo "Starting Fedora..."
/usr/local/bin/start_fedora.sh &

echo "Starting sidekiq..."
cd /data
DISABLE_REDIS_CLUSTER=true bundle exec sidekiq &

echo "Starging rails server..."
sleep 15
DISABLE_REDIS_CLUSTER=true bundle exec rails server -b 0.0.0.0
