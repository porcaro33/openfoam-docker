#!/bin/bash

# git clone
git clone https://github.com/porcaro33/openfoam-docker.git

# rnu setup script
cd openfoam-docker
./bastion_setup.sh

# docker build
sudo docker build -t openfoam-batch:latest .

# push to ECR
aws ecr get-login --no-include-email --region us-west-2
# Run the docker login command that was returned in "ecr get-login" command
sudo docker tag openfoam-batch:latest <account-id>.dkr.ecr.us-west-2.amazonaws.com/openfoam-batch:latest
sudo docker push <account-id>.dkr.ecr.us-west-2.amazonaws.com/openfoam-batch:latest

# edit json files
sudo vi job_definition.json
sudo vi computing_env.json
sudo vi job_queue.json

# job definition
aws --region us-west-2 batch register-job-definition --cli-input-json file://job_definition.json

# create computing environmemt
aws --region us-west-2 batch create-compute-environment --cli-input-json file://computing_env.json

# creating job queue
aws --region us-west-2 batch create-job-queue --cli-input-json file://job_queue.json

# submit jobs
./submit_batch.sh
