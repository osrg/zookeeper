#! /bin/bash

bash clean.sh

EQPATH=$HOME/github/earthquake.git/earthquake/earthquake

$EQPATH --launch-orchestrator --search-mode --search-policy dumb --execution-file-path=zkexe.json --search-mode-directory processpacket/ &

bash ./quorumStart.sh
bash ./concurrentWrite.sh
sleep 1
bash ./quorumStop.sh

