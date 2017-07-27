# openfoam-docker
scripts and Dockerfile for running openfoam on AWS batch

installation was verified with following version
ubuntu = 14.04
openfoam = 4.1
paraview = 5.0
awscli = 1.11.123

AWS region = us-west-2

steps
1. login to aws console with admin
2. move to Oregon region
3. create a KeyPair
4. run CloudFormation template for AWS Batch base
5. login to bastion ubuntu server
6. run ubuntu setup script
7. build Docker images with the Dockerfile
8. push the images to AWS ECR
9. create job definition on AWS Batch
10. create computing environment on AWS Batch
11. create job queue on AWS Batch
12. submit jobs
