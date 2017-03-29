#!/bin/bash

export AWS_DEFAULT_PROFILE=private

aws batch register-job-definition --cli-input-json file:///Users/hiroshi/github/job_definition.json
aws batch create-compute-environment --cli-input-json file:///Users/hiroshi/github/computing_env.json
aws batch create-job-queue --cli-input-json file:///Users/hiroshi/github/job_queue.json
