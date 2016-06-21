#!/bin/bash

KAFKA_HEAP_OPTS="-Xmx4M -Xms4M" /opt/confluent-3.0.0/bin/kafka-server-start ./config/server.properties
