#! /bin/bash

EQPATH=$HOME/github/earthquake.git/earthquake/earthquake

$EQPATH --launch-orchestrator --search-mode --execution-file-path=zkexe.json --search-mode-directory zkSearchInfo/ &

bash ./quorumStart.sh
bash ./concurrentWrite.sh
sleep 3
bash ./quorumStop.sh

