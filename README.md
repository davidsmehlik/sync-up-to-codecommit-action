# Sync up to AWS CodeCommit Action

Synchronize from GitHub repository to AWS CodeCommit via GitHub Actions.  
No need to ssh-private-key. Need to AWS IAM Credentials only.

## Prerequisities

To use this Github Action, you first need to create a new Identity Provider in the IAM portal and a role that you assign the `AWSCodeCommitFullAccess` right to.

For example, you can find instructions for creating this role [here](https://www.automat-it.com/post/using-github-actions-with-aws-iam-roles).

## Example usage

```yaml
name: Sync up to CodeCommit

on:
  push:
    branches:
      - '*'
  workflow_dispatch:

permissions:
  id-token: write
  contents: read

jobs:
  sync:
    runs-on: ubuntu-latest
  
    steps:
      - name: Checkout
        uses: actions/checkout@v3
        with:
          fetch-depth: 0
  
      - name: Configure AWS Credentials
        uses: aws-actions/configure-aws-credentials@v4
        with:
          role-to-assume: arn:aws:iam::3***:role/github-actions-role
          role-session-name: github-actions-role
          aws-region: eu-central-1
  
      - name: Sync up to CodeCommit
        uses: davidsmehlik/sync-up-to-codecommit-action@v1
        with:
          repository_name: test-repo
          aws_region: eu-central-1
          branch_name: master
```

## Inputs

- `repository_name` **Required** CodeCommit repository name.
- `aws_region` **Required** Region of the CodeCommit repository.
- `branch_name` Specific branch to sync. If no specified, all branches will be synced.

## License

[MIT](LICENSE)

