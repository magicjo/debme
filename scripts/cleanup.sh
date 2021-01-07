#!/bin/bash

set -o nounset
set -o errexit

# Cleanup tmp
rm -rf /tmp/*

# Cleanup apt cache
apt --yes autoremove --purge
apt --yes clean
apt --yes autoclean

# Clean up orphaned packages with deborphan
apt --yes install deborphan
while [ -n "$(deborphan --guess-all --libdevel)" ]; do
    deborphan --guess-all --libdevel | xargs apt-get -y purge
done
apt --yes purge deborphan dialog

# Make sure we wait until all the data is written to disk, otherwise
# Packer might quite too early before the large files are deleted
sync
