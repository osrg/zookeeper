#! /bin/bash

export ZOOBINDIR=../bin/
. ../bin/zkEnv.sh

EQ_ENV_PROCESS_ID=zkcli1 EQ_MODE_DIRECT=1 java -cp $CLASSPATH:out/production/myZkCli -javaagent:/home/mitake/github/earthquake.git/inspector/java/base/target/earthquake-inspector.jar=script:client.btm  MyZkCli localhost:2181 &

EQ_ENV_PROCESS_ID=zkcli2 EQ_MODE_DIRECT=1 java -cp $CLASSPATH:out/production/myZkCli -javaagent:/home/mitake/github/earthquake.git/inspector/java/base/target/earthquake-inspector.jar=script:client.btm  MyZkCli localhost:2182

