#!/usr/bin/env bash

SCRIPTBIN="${BASH_SOURCE-$0}"
SCRIPTBIN=`dirname ${SCRIPTBIN}`
ZOOBINDIR=`cd ${SCRIPTBIN}/../../bin; pwd`

"$ZOOBINDIR"/zkEnv.sh

"$ZOOBINDIR"/zkCli.sh create /invalidsnaps dummyValue | grep invalidsnap

i=1
while [ ${i} -le 20 ]
do
    t=1
    while [ ${t} -le 5 ]
    do
        znode_name="/invalidsnaps/invalidsnap-${t}-${i}"
        $ZOOBINDIR/zkCli.sh create ${znode_name} dummyValue | grep "Node does not exist" &
        eval 'pid'${t}=$!

        t=`expr $t + 1`
    done
    wait
    if [ $i -eq 19 ]
    then
        sleep 15
        bash ${ZOOBINDIR}/zkCleanup.sh -n 3 &
        sleep 5
    fi
    i=`expr $i + 1`
done

