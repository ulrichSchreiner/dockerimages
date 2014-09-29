#!/bin/sh

service redis-server start
service mysql start
service gitlab start
tail -f /home/git/gitlab/log/sidekiq.log

