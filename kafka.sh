#!/bin/bash

KAFKA_HEAP_OPTS="-Xmx6M -Xms6M" /opt/confluent-3.0.0/bin/kafka-server-start ./config/server.properties
