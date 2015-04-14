-------------------------------------------------
reproduce by Earthquake
-------------------------------------------------

Summary:

1. Inject pause during purge to data while create znode by createZnode.sh
2. Check up status of Znode by validateZnode.sh
3. Clean up by deleteZnode.sh


Prerequisite:

- AspectJ require
# ajc -version
AspectJ Compiler 1.8.4 (1.8.4 - Built: Thursday Nov 6, 2014 at 20:19:21 GMT) - Eclipse Compiler BETA_JAVA8_2b07958, 3.11

- Go require
# go version
go version go1.4 linux/amd64

- Protoc require
# protoc --version
libprotoc 2.6.1


Procedure:

- get earthquake source code
# git clone https://github.com/osrg/earthquake.git /root/git/earthquake

- install earthquake
# cd /root/git/earthquake
# ./build

- get zookeeper source code (in mirror)
# git clone https://github.com/osrg/zookeeper.git /root/git/osrg_zookeeper

- zookeeper branch change
# cd /root/git/osrg_zookeeper
# git checkout -b zookeeper-1797 origin/zookeeper-1797

- Add the jar file of aspectj and earthquake in lib dir of Zookeeper
# cp /root/git/osrg_zookeeper/earthquake/zookeeper-1797/lib/* /root/git/osrg_zookeeper/src/java/lib/

- Placement of Aspect file
# cp /root/git/osrg_zookeeper/earthquake/zookeeper-1797/aj/PurgeTxnLogHook.aj /root/git/osrg_zookeeper/src/java/main/org/apache/zookeeper/server/

- create zookeeper config file
# cp /root/git/osrg_zookeeper/conf/zoo_sample.cfg /root/git/osrg_zookeeper/conf/zoo.cfg

- change rotation interval(Set to rotate at 20 transaction)
# echo snapCount=20 >> /root/git/osrg_zookeeper/conf/zoo.cfg

- build zookeeper
# cd /root/git/osrg_zookeeper/
# ant clean jar-ajc

- set environment variable for earthquake
# export EQ_DIRECT_MODE=1
# export EQ_ENV_PROCESS_ID=zookeeper-1797

- start earthquake
# /root/git/earthquake/earthquake/earthquake --launch-orchestrator --daemonize --log-file-path=/root/earthquake.log --execution-file-path=/root/git/osrg_zookeeper/earthquake/zookeeper-1797/1797.json

- start zookeeper
# /root/git/osrg_zookeeper/bin/zkServer.sh start

- Znode create & purge run (sleep processing inserted into the purge by Earthquake)
# sh /root/git/osrg_zookeeper/earthquake/zookeeper-1797/createZnode.sh

- restart zookeeper
# /root/git/osrg_zookeeper/bin/zkServer.sh stop
# /root/git/osrg_zookeeper/bin/zkServer.sh start

- check znode
# sh /root/zookeeper-release-3.4.5/earthquake/zookeeper-1797/validateZnode.sh

(Example output)
- if All znode exist:
100 znodes exist!

- if some missing of znode:
Unexpected exception when visiting znode!: error_count=XXX

- clean up znode:
# sh /root/zookeeper-release-3.4.5/earthquake/zookeeper-1797/deleteZnode.sh

