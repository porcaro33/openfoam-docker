#!/bin/bash

# select aws profile
export AWS_DEFAULT_PROFILE=<your_profile>
# or run aws configure and set your credential info
aws configure

# docker build
docker build -t openfoam-batch:latest .

# push to ECR
aws ecr get-login --no-include-email --region us-west-2
# Run the docker login command that was returned in "ecr get-login" command
sudo docker tag openfoam-batch:latest <account-id>.dkr.ecr.us-west-2.amazonaws.com/openfoam-batch:latest
sudo docker push <account-id>.dkr.ecr.us-west-2.amazonaws.com/openfoam-batch:latest

# job definition
aws --region us-west-2 batch register-job-definition --cli-input-json file://job_definition.json

# create computing environmemt
aws --region us-west-2 batch create-compute-environment --cli-input-json file://computing_env.json

# creating job queue
aws --region us-west-2 batch create-job-queue --cli-input-json file://job_queue.json

# submit jobs
./submit_batch.sh
