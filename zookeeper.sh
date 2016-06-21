#!/bin/bash

KAFKA_HEAP_OPTS="-Xmx2M -Xms2M" /opt/confluent-3.0.0/bin/zookeeper-server-start ./config/zookeeper.properties