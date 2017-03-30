#!/bin/bash

# select aws profile
export AWS_DEFAULT_PROFILE=<your_profile>

# job definition
aws batch register-job-definition --cli-input-json file://<path>/job_definition.json

# create computing environmemt
aws batch create-compute-environment --cli-input-json file://<path>/computing_env.json

# creating job queue
aws batch create-job-queue --cli-input-json file://<path>/job_queue.json

# submit jobs
<path>/submit_batch.sh
