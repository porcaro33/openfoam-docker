# openfoam-docker
scripts and Dockerfile for running openfoam on AWS batch

installation and running were verified with following version
ubuntu = 14.04
openfoam = 4.1
paraview = 5.0
awscli = 1.11.67

AWS region = us-east-1 (AWS Batch is only available on us-east-1 at 2017.March)

steps
1. create AWS Elastic Container Repository(ECR)
2. create s3 bucket for result data store
3. build Docker images with the Dockerfile
4. push the images to AWS ECR
5. create job definition on AWS Batch (job_definition.json)
6. create job queue on AWS Batch
7. create computing environment on AWS Batch
8. submit jobs (submit_batch.sh)
