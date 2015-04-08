#!/usr/bin/env bash

SCRIPTBIN="${BASH_SOURCE-$0}"
SCRIPTBIN=`dirname ${SCRIPTBIN}`
ZOOBINDIR=`cd ${SCRIPTBIN}/../../bin; pwd`

"$ZOOBINDIR"/zkEnv.sh

echo "znode deleteall: /invalidsnaps"
$ZOOBINDIR/zkCli.sh deleteall /invalidsnaps | grep "Node does not exist"

bash ${ZOOBINDIR}/zkCleanup.sh -n 3

