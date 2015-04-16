#! /bin/bash

for i in `seq 1 3`;
do
    ZOO_LOG_DIR=logs/$i/ bin/zkServer.sh --config quorumconf/$i start
done
