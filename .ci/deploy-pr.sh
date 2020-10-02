#!/bin/bash

mkdir -p ~/.aws

cat <<EOF > ~/.aws/credentials
[default]
aws_access_key_id=$S3_ACCESS_KEY
aws_secret_access_key=$S3_SECRET_KEY
EOF

alias s3="aws s3 --endpoint=https://us-east-1.linodeobjects.com"

s3 sync pubilc/ s3://ci.smuggle.us/$TRAVIS_BRANCH
