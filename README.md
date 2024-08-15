# CD12352 - Infrastructure as Code Project Solution
# THOMAS LOUIS

## _Spin up instructions_

1. Pre-requisite: Validate cloudformation template
    ```sh
        ./starter/scripts/validate-cloudformation-template.sh <cfntemplate>
    ```
2. Create Network Infrastructure
    ```sh
    ./starter/scripts/create-stack.sh starter/network/network.yml network-create starter/network/network-parameters.json
    ```
3. Build lambda layers using docker container image
    -a. Create python.zip with the required libraries
    ```sh
    cd starter/docker-awslayer
    chmod +x runner.sh
    ./runner.sh
    ```
     This script will build a docker image from the Dockerfile and create a container where 'docker_install.sh' is copied over and executed. Then resultant python.zip file is copied from the container to the project folder. 
    -b. Create S3 bucket and upload 'python.zip' to S3.
     CFN template is run using the following command
     ```sh
     ./starter/scripts/create-stack.sh starter/s3/udagram-s3-infra.yml s3-create starter/s3/udagram-s3-params.json
     ```
     ```sh
     ./starter/scripts/upload-pylib-cfn-s3.sh <s3bucketname>
     ```
    -c. Create Lambda Function and Lambda Layer 
    CFN template is run using the following command
    ```sh
    ./starter/scripts/create-stack.sh starter/s3copylambda/udagram-copytos3.yml s3copylambda-create starter/s3copylambda/udagram-copytos3-params.json
    ```
4. Create Server Infrastructure and deploy index.html from github
    ```sh
    ./starter/scripts/create-stack.sh starter/server/udagram.yml network-create starter/server/udagram-parameters.json
    ```
    ```sh
    ./starter/scripts/deploywebapp2s3.sh <function url of lambda>
    ```
    Function URL can be fetched from the output of "s3copylambda-create" stack

## _Tear down instructions_
    ```sh
    ./starter/scripts/delete-stack.sh <stackname>
    ```
## _Other considerations_
> Jump host (Bastion Host) will be created as part of server-create stack and can be used to SSH into EC2 instances on the private subnet


