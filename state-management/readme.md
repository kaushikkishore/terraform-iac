## Remote State Management

You can manage the state of the terraform in the s3 and the locking of the state can be achieved using DynamoDB. [Documentation](https://developer.hashicorp.com/terraform/language/settings/backends/s3)

The state files are stored in the s3 and for locking process when a user is updating or working on the state file at that time a key is added in the DynamoDB to lock the state.

You need to create a backedn.tf file

```
terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "path/to/my/key"
    region = "us-east-1"
    dynamodb_table = "<table-name>"
  }
}

```

Bucket permissions

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::mybucket"
    },
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"],
      "Resource": "arn:aws:s3:::mybucket/path/to/my/key"
    }
  ]
}
```

- When creating the DynamoDB table make sure the table have `LockID` key as `String` datatype.

Dynamo DB table permissions

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "dynamodb:DescribeTable",
        "dynamodb:GetItem",
        "dynamodb:PutItem",
        "dynamodb:DeleteItem"
      ],
      "Resource": "arn:aws:dynamodb:*:*:table/mytable"
    }
  ]
}
```

> You can force unlock the lock. But be sure the lock is not used by the any other team member, otherwise this may create a mess.
> Make sure to use AWS s3 versioning so you can restore back in the time.

### State management

Make sure you do not modify the state manually.

Use some popular state management - [Documetation](https://developer.hashicorp.com/terraform/cli/commands/state/list)
