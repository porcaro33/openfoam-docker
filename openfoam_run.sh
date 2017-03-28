#!/bin/bash

# geting JOB ID, bucket name
BUCKETNAME="openfoam.batch"

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
TIMESTAMP=`date +%Y%m%d%H%M`
#cp ./298/U /root/$TIMESTAMP
#cat /root/$TIMESTAMP
aws s3 cp ./298/U s3://$BUCKETNAME/$TIMESTAMP
