#!/bin/bash

QUEUE="openfoam-docker-queue"
JOBDEF="openfoam-docker-job"
MAXITR=10

for i in `seq 1 $MAXITR`
do
  JOBNAME="JOB_$i"
  aws batch submit-job --job-name $JOBNAME --job-queue $QUEUE --job-definition $JOBDEF
  echo "submitted $JOBNAME"
  sleep 10
done
