#!/bin/bash

QUEUE="openfoam-batch-queue"
JOBDEF="openfoam-batch-job"
REGION="us-west-2"
TIMES=10

for i in `seq 1 $TIMES`
do
  JOBNAME="JOB_$i"
  aws --region $REGION batch submit-job --job-name $JOBNAME --job-queue $QUEUE --job-definition $JOBDEF
  echo "submitted $JOBNAME"
  sleep 10
done
