#!/bin/bash

DOCKER_MACHINE=172.17.0.1

docker run -d --name zookeeper \
    -p 2181:2181 \
    -v /tmp:/tmp \
    --env KAFKA_HEAP_OPTS='-Xms16M -Xmx16M' \
    confluent/zookeeper
    
docker run -d --name kafka \
    -p 9092:9092 \
    -v /tmp:/tmp \
    --env KAFKA_HEAP_OPTS='-Xms100M -Xmx100M' \
    --env KAFKA_CFG_URL='https://raw.githubusercontent.com/mhowlett/kafka-low-end-test/master/config/server.properties' \
    --link zookeeper:zookeeper \
    confluent/kafka

docker run -d --name producer \
    -v /git/kafka-low-end-test/target:/target \
    java:8u91 \
    java -jar /target/kafka-low-end-test-1.0-SNAPSHOT-jar-with-dependencies.jar 1000 172.17.0.1
