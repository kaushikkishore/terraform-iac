# variable "user" {
#   type    = string
#   default = "ec2-user"
# }

# variable "ami" {
#   type        = string
#   default     = "ami-067c21fb1979f0b27"
#   description = "Amazon Linux2 AMI"
# }

variable "user" {
  type    = string
  default = "ubuntu"
}

variable "ami" {
  type        = string
  default     = "ami-0f5ee92e2d63afc18"
  description = "Ubuntu AMI"
}

