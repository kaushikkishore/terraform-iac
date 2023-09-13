| Command                                                  | Usage                                                                          |
| :------------------------------------------------------- | :----------------------------------------------------------------------------- |
| `terraform init`                                         | initialise a new provider                                                      |
| `terraform plan`                                         | shows plan for the current terraform scripts                                   |
| `terraform apply`                                        | apply the plan                                                                 |
| `terraform apply -auto-approve`                          | Won't ask to approve                                                           |
| `terraform destroy`                                      | This will destroy all the resources.                                           |
| `terraform refresh`                                      | run with cautions as this will refresh the .tfstate file                       |
| `terraform init -upgrade`                                | upgrading to a new version                                                     |
| `terraform.tfvars`                                       | Filename for variables                                                         |
| `terraform plan -var-file="custom-file.tfvar"`           | specify or pass different varfile for the plan or apply                        |
| `terraform console`                                      | to run terraform functions                                                     |
| `export TF_LOG=TRACE` and `export TF_LOG_PATH=/temp/log` | to set the logging levels and to set the logs to the specified file.           |
| `terraform fmt`                                          | format the terraform script                                                    |
| `terraform validate`                                     | validates the terraform script                                                 |
| `terraform apply -replace="aws_instance.<name>`          | to force reload the instance incase application is broken.                     |
| `terraform graph`                                        | this will give the picture of the resouce                                      |
| `cat /etc/os-release`                                    | To get your version of the `os`                                                |
| `terraform plan -out=demopath`                           | This will save the current plan to the demopath. Later you can apply the path. |
| `terraform apply demopath`                               | apply the saved configuration                                                  |
| `terraform workspace new dev`                            | create a new dev workspace                                                     |
| `terraform workspace list`                               | lists all workspcase with `*` on current workspace                             |
| `terraform workspcae select dev`                         | select the workspace dev                                                       |

To go agead with terraform graph. you need another dependency to render. as the graph will give you a dot file.

`terraform graph > graph.dot` - this will save the graph to dot file.

based on `os` go ahead and download the [graphviz](https://graphviz.org/download/)

considering the amazon ec2 with linux2

`sudo yum install graphviz`

now run this -> `cat graph.dot | dot -Tsvg > graph.svg`

now copy the content of the svg to your machine and look for the results.

### Setting up terraform on your machine

You can look into for steps here -> [Medium](https://medium.com/@kk12391/setup-aws-credentials-for-terraform-mac-m1-or-apple-silicon-b7dae25a3be2)
