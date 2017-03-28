# openfoam-docker
scripts and Dockerfile for running openfoam on AWS batch

installation and runnning were verified with following version
ubuntu = 14.04
openfoam = 4.1
paraview = 5.0
awscli = 1.11.67

AWS region = us-east-1 (AWS Batch is only vailable on us-east-1 at 2017.March)

steps
1. create AWS Elastic Container Repository(ECR)
2. build Docker images with the Dockerfile
3. push the images to AWS ECR
4. create job definition on AWS Batch (job_definition.json)
5. create job queue on AWS Batch
6. create conputig environment on AWS Batch
7. submit jobs (submit_batch.sh)
