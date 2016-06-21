#!/bin/bash

KAFKA_HEAP_OPTS="-Xmx3M -Xms3M" /opt/confluent-3.0.0/bin/zookeeper-server-start ./config/zookeeper.properties