#!/bin/bash

mkdir /opt
cd /opt

wget http://packages.confluent.io/archive/3.0/confluent-3.0.0-2.11.tar.gz
tar xvf confluent-3.0.0-2.11.tar.gz

wget -O jre32.tar.gz http://javadl.oracle.com/webapps/download/AutoDL?BundleId=207763
tar xvf jre32.tar.gz


