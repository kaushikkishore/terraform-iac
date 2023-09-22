data "vault_generic_secret" "rds_creds" {
  path = "astuto/rds" # Specify the path where your RDS credentials are stored in Vault
}

resource "aws_db_instance" "terraform_rds_mysql" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = data.vault_generic_secret.rds_creds.data["username"]
  password             = data.vault_generic_secret.rds_creds.data["password"]
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  publicly_accessible  = true
  tags = {
    "Name" = "terraform-rds-create-vault"
  }
}

output "address" {
  value = aws_db_instance.terraform_rds_mysql.address
}

output "endpoint" {
  value = aws_db_instance.terraform_rds_mysql.endpoint

}
