resource "aws_instance" "myec2" {
  ami           = "ami-0f5ee92e2d63afc18"
  for_each      = toset(["t2.micro", "t3.micro"])
  instance_type = each.value
  tags = {
    "Name" = "terraform-ec2-instance-${each.key}"
  }
  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      tags
    ]
  }
}
