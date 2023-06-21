#!/bin/sh
S3_BUCKET=mlops-for-govcloud #bucket to store SAM template [Make sure you have created this S3 bucket manually.
S3_BUCKET_MODEL=mlops-for-govcloud #bucket to store ML models [Make sure you have created this S3 bucket manually.
STACK_NAME=sam-sf-sagemaker-workflow-govcloud
sam build  -t cfn/sam-template.yaml --use-container
sam deploy --profile gov --template-file .aws-sam/build/template.yaml --stack-name ${STACK_NAME} --force-upload --s3-bucket ${S3_BUCKET} --s3-prefix sam --parameter-overrides S3ModelBucket=${S3_BUCKET_MODEL} --capabilities CAPABILITY_IAM