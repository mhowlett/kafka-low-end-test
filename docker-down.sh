#!/bin/bash

docker kill producer
docker kill kafka
docker kill zookeeper

docker rm -f producer
docker rm -f kafka
docker rm -f zookeeper

rm -rf /tmp/zookeeper
rm -rf /tmp/kefka-logs
