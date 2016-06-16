#!/bin/bash

mkdir /opt
cd /opt
wget http://javadl.oracle.com/webapps/download/AutoDL?BundleId=207763
# wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u91-b14/jdk-8u91-linux-x64.tar.gz
tar xvf jdk-8u91-linux-x64.tar.gz
