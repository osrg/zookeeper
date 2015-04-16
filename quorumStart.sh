#! /bin/bash

for i in `seq 1 3`;
do
    bin/zkServer.sh --config quorumconf/$i start
done
