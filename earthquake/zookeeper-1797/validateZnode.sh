#!/usr/bin/env bash

SCRIPTBIN="${BASH_SOURCE-$0}"
SCRIPTBIN=`dirname ${SCRIPTBIN}`
ZOOBINDIR=`cd ${SCRIPTBIN}/../../bin; pwd`

"$ZOOBINDIR"/zkEnv.sh

LOG_TMP=/tmp/validateZnodeResult.log

i=1
while [ ${i} -le 20 ]
do
    t=1
    while [ ${t} -le 5 ]
    do
        znode_name="/invalidsnaps/invalidsnap-${t}-${i}"
        echo "znode get: ${znode_name}"
        ${ZOOBINDIR}/zkCli.sh get ${znode_name} >> ${LOG_TMP} 2>&1 &

        t=`expr $t + 1`
    done
    wait
    i=`expr $i + 1`
done

if [ `grep -c "Node does not exist" ${LOG_TMP}` -eq 0 ]
then
    echo "100 znodes exist!"
else
    echo "Unexpected exception when visiting znode!: error_count=`grep -c "Node does not exist" ${LOG_TMP}`"
fi

rm -rf ${LOG_TMP}

