resource "aws_dynamodb_table" "dynamodb-terraform-lock" {
  name           = "terraform-lock"
  hash_key       = "LockID"
  read_capacity  = 5
  write_capacity = 5

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "Name" = "Terraform Lock Table"
  }
}

terraform {
  backend "s3" {
    bucket = "elasticache-20230131"
    region = "us-east-1"
    key    = "terraform.tfstate"
  }
}

provider "aws" {
  region = var.region
}