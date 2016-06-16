#!/bin/bash

KAFKA_HEAP_OPTS="-Xmx8M -Xms8M" /opt/confluent-3.0.0/bin/zookeeper-server-start ./config/zookeeper.properties