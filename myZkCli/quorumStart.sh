#! /bin/bash

export ZOOBINDIR=../bin/
. ../bin/zkEnv.sh

AGENT_CP=/home/mitake/github/earthquake.git/inspector/java/base/target/earthquake-inspector.jar

for i in `seq 1 3`;
do
    DIR=/tmp/zookeeper$i/
    if [ ! -d $DIR ];
    then
	mkdir $DIR
	echo $i > $DIR/myid
    fi

    EQ_MODE_DIRECT=1 EQ_ENV_PROCESS_ID=zksrv$i SERVER_JVMFLAGS="-javaagent:$AGENT_CP=script:server2.btm" ZOO_LOG_DIR=logs/$i/ ../bin/zkServer.sh --config ../quorumconf/$i start
done
