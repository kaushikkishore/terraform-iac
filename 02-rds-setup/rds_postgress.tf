data "vault_generic_secret" "rds_creds" {
  path = "astuto/rds" # Specify the path where your RDS credentials are stored in Vault
}

resource "aws_db_instance" "terraform_rds_mysql" {
  allocated_storage      = 20
  storage_type           = "gp2"
  name                   = "my-postgres-db"
  engine                 = "postgres"
  engine_version         = "15.3"
  instance_class         = "db.t3.micro"
  username               = data.vault_generic_secret.rds_creds.data["username"]
  password               = data.vault_generic_secret.rds_creds.data["password"]
  parameter_group_name   = "default.postgres.15"
  skip_final_snapshot    = true
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.terraform_rds_postgres_sg.id]
  subnet_ids             = [aws_subnet.terraform_public_subnet.id]
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
