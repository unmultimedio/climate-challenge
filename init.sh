#!/bin/bash

# Install any new gems that could be pulled
echo 'Checking if any new gem'
bundle install --jobs=20
# Deletes any possible server that remained running during last wakeup
echo 'Deleting previous pid files:'
ls /myapp/tmp/pids
rm -rf /myapp/tmp/pids/*
# And starts the server in mode development in 0.0.0.0:3000
echo 'Spinning up the server!'
bundle exec rails server -b 0.0.0.0