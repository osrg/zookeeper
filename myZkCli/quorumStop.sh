#! /bin/bash

export ZOOBINDIR=../bin/
. ../bin/zkEnv.sh

for i in `seq 1 3`;
do
    ../bin/zkServer.sh --config ../quorumconf/$i stop
done
