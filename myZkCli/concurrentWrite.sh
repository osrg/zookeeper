#! /bin/bash

export ZOOBINDIR=../bin/
. ../bin/zkEnv.sh

AGENT_CP=/home/mitake/github/earthquake.git/bin/earthquake-inspector.jar

EQ_ENV_PROCESS_ID=zkcli1 EQ_MODE_DIRECT=1 java -cp $CLASSPATH:out/production/myZkCli -javaagent:$AGENT_CP=script:client.btm  MyZkCli localhost:2181 &

EQ_ENV_PROCESS_ID=zkcli2 EQ_MODE_DIRECT=1 java -cp $CLASSPATH:out/production/myZkCli -javaagent:$AGENT_CP=script:client.btm  MyZkCli localhost:2182

