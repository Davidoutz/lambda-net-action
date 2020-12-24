#!/bin/sh
: ${AWS_REGION:=us-east-1}
: ${DOTNET_LAMBDA_PACKAGE_NAME:=latest.zip}
export PATH="$PATH:/root/.dotnet/tools"
cd "${DOTNET_LAMBDA_WORKING_DIR:-.}"
dotnet lambda package $DOTNET_LAMBDA_PACKAGE_NAME
aws s3 cp --only-show-errors $DOTNET_LAMBDA_PACKAGE_NAME s3://$DOTNET_LAMBDA_S3_LOCATION/$DOTNET_LAMBDA_PACKAGE_NAME
exit
