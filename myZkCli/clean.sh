#! /bin/bash

for i in `seq 1 3`;
do
    DIR=/tmp/zookeeper$i/
    rm -f $DIR/zookeeper_server.pid
    rm -rf $DIR/version-2
done
