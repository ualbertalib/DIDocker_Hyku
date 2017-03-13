#!/bin/bash
cd /data
echo 'download_dir: /solr' >> .solr_wrapper
echo 'cloud: false' >> .solr_wrapper
su solr -c 'bundle exec solr_wrapper --version 6.4.2 -i /solr/server --persist'
