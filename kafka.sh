#!/bin/bash

KAFKA_HEAP_OPTS="-Xmx64M -Xms64M" /opt/confluent-3.0.0/bin/kafka-server-start ./config/server.properties
