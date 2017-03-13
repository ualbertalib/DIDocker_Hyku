#!/bin/bash
cd /data
echo 'download_dir: /fedora' >> .fcrepo_wrapper
bundle exec fcrepo_wrapper -i /fedora/server -d /fedora
