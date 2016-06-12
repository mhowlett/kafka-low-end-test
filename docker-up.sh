#!/bin/bash

docker run -d --name zookeeper \
    -p 2181:2181 \
    --env KAFKA_HEAP_OPTS='-Xms8M -Xmx8M' \
    confluent/zookeeper
    
docker run -d --name kafka \
    -p 9092:9092 \
    --env KAFKA_HEAP_OPTS='-Xms100M -Xmx100M' \
    --link zookeeper:zookeeper \
    confluent/kafka
