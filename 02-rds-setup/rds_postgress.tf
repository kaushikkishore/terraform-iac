# data "vault_generic_secret" "rds_creds" {
#   path = "astuto/rds" # Specify the path where your RDS credentials are stored in Vault
# }

# resource "aws_db_parameter_group" "terraform_rds_postgres_param_group" {
#   name   = "my-terraform-pg"
#   family = "postgres15"

#   parameter {
#     name  = "log_connections"
#     value = "1"
#   }
# }

resource "aws_db_instance" "terraform_rds_postgres" {
  identifier = "terraform-rds-postgres"

  allocated_storage   = 300
  storage_type        = "gp3"
  engine              = "postgres"
  engine_version      = "15.3"
  instance_class      = "db.t3.micro"
  username            = "postgres"
  password            = "p0$tgre$$123"
  skip_final_snapshot = true
  publicly_accessible = true
  apply_immediately   = true # if this is false then some changes might not apply immediately. 
  tags = {
    "Name" = "terraform-rds-postgres-vault"
  }
}

output "address" {
  value = aws_db_instance.terraform_rds_postgres.address
}

output "endpoint" {
  value = aws_db_instance.terraform_rds_postgres.endpoint

}

output "password" {
  value     = aws_db_instance.terraform_rds_postgres.password
  sensitive = true
}
