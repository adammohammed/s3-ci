#!/bin/bash


sudo apt-get update && sudo apt-get install -yq awscli libs3-2

cleanup_pr () {
    PRID=$(git log -1 | grep -oP 'Merge pull request #\K\d+')

    mkdir -p ~/.aws/
    cat <<EOF > ~/.aws/credentials
[default]
aws_access_key_id=$S3_ACCESS_KEY
aws_secret_access_key=$S3_SECRET_KEY
EOF
    s3="aws s3 --endpoint=https://us-east-1.linodeobjects.com"

    ${s3} rm --recursive s3://ci.smuggle.us/PR-${PRID}
}


cleanup_pr
