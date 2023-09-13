### You can create your own module. And later you can use in your code.

Beenefits of creating and using a module is `DRY` principles. This will help to have proper codebase with correct set of guidelines.

You can specify variables in module and that can be overriden by the end user who is using it.

There are standard module which is provided by the different cloud providers like `AWS`, `GCP`, `AZURE` you can look at terraform registry to get standard module and you can customise based on your needs.

> Note - Use local variables in case when you do not want to expose the variables to user and to keep the `DRY` up.

### Workspcae

You can create multiple workspace and then you can define a map to be used by the workspace. That will help you to get the better variables usage and then switch to workspace where you are.

```
variable "instance_type" {
    type = "map"
    default = {
        default = "t2.micro"
        dev = "t2.medium"
        prod = "t2.large"
    }
}

resource "aws_instance" "my_ec2" {
    ami = "some-ami-id"
    instance_type = lookup(var.instance_type, terraform.workspace)
}

```

based on the workspace it will take the instance type. For each workspace a different `.tfstate` file will be generated. The defautl `.tfstate` file will be generated in root of the folder.

other workspace state files will be inside

`terraform.tfstate.d` -> `dev` or `prod`
