#!/bin/bash

# geting JOB ID, bucket name
BUCKETNAME="s3://openfoam.batch/"

# run OpenFoam4 with tutrial model "pitzDaily"
source /opt/openfoam4/etc/bashrc
source /root/.bashrc

cd /root
mkdir -p $FOAM_RUN
cd $FOAM_RUN
cp -r $FOAM_TUTORIALS/incompressible/simpleFoam/pitzDaily .
cd pitzDaily
blockMesh
simpleFoam

# upload U to S3
aws s3 cp ./200/U s3://$BUCKETNAME/U_JOBID
