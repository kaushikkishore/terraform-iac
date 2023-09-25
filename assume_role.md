## Assume role setup

### Overview

You are providing services to a client. The client will create a role for you and he can attach the permissions for your role. This is how he can control your access.

To fullfill this you need to perform these steps.

Navigate to AWS `IAM` -> `Roles` -> `Create Role` -> `Select Custom Trust Policy` in the input json replace everything with the below content.
Make sure you are replacing the correct user arn.

Once this is done now you can attach permissions to the role in next step -> consider you want to give full access to EC2 then you will attach a policy for the same in the next step.

Then create a role. Once finished you will get an role arn you can use the role arn in the terraform to do operations in the user account based on the permissions.

A sample arn -> `arn:aws:iam::093759275967:role/kaushik-assume-role-ec2`

```
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "I4fGpkdLJk",
			"Effect": "Allow",
			"Principal": {
				"AWS": "arn:aws:iam::712554059530:user/kaushik.scrollx"
			},
			"Action": "sts:AssumeRole"
		}
	]
}
```

in terraform script in aws configuration make changes like this.

```
provider "aws" {
  # Configuration options
  region = "ap-south-1"
  assume_role {
    role_arn = "arn:aws:iam::093759275967:role/kaushik-assume-role-ec2"
  }
}

```

Post this you do not change any configuration in your `~/.aws/config` file where the credentials resides for you.
