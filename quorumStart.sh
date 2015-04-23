#! /bin/bash

for i in `seq 1 3`;
do
    DIR=/tmp/zookeeper$i/
    if [ ! -d $DIR ];
    then
	mkdir $DIR
	echo $i > $DIR/myid
    fi

    ZOO_LOG_DIR=logs/$i/ bin/zkServer.sh --config quorumconf/$i start
done
