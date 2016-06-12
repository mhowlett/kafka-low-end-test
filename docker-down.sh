#!/bin/bash

docker kill kafka
docker kill zookeeper

docker rm -f kafka
docker rm -f zookeeper

