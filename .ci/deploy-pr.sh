#!/bin/bash
set -x

mkdir -p ~/.aws
CWD=$(pwd)
cat <<EOF > ~/.aws/credentials
[default]
aws_access_key_id=$S3_ACCESS_KEY
aws_secret_access_key=$S3_SECRET_KEY
EOF

sudo apt-get update && sudo apt-get install -yq awscli libs3-2

s3="aws s3 --endpoint=https://us-east-1.linodeobjects.com"

${s3} sync $CWD/public/ s3://ci.smuggle.us/PR-$TRAVIS_PULL_REQUEST
