#!/bin/sh

set -ue

RepositoryName="${INPUT_REPOSITORY_NAME}"
AwsRegion="${INPUT_AWS_REGION}"
BranchName="${INPUT_BRANCH_NAME}"
CodeCommitUrl="https://git-codecommit.${AwsRegion}.amazonaws.com/v1/repos/${RepositoryName}"

git config --global --add safe.directory /github/workspace
git config --system --unset credential.helper
# git config --global credential.'https://git-codecommit.*.amazonaws.com'.helper '!aws codecommit credential-helper $@'
git config --global credential.UseHttpPath true
git remote add sync ${CodeCommitUrl}
git push sync ${BranchName}
