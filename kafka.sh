#!/bin/bash

KAFKA_HEAP_OPTS="-Xmx32M -Xms32M" /opt/confluent-3.0.0/bin/kafka-server-start ./config/server.properties
