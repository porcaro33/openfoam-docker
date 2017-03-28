#!/bin/bash

QUEUE="openfoam-job-queue"
JOBDEF="openfoam-docker"
MAXITR=5

for i in `seq 1 $MAXITR`
do
  JOBNAME="JOB$i"
  aws batch submit-job --job-name $JOBNAME --job-queue $QUEUE --job-definition $JOBDEF
  echo "submitted $JOBNAME"
  sleep 30
done
