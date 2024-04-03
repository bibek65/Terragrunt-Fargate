remote_state{
  backend = "s3"
  generate ={
    path = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket = "bibek-api-terraform-state-bucket"
    key = "${path_relative_to_include()}/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    dynamodb_table = "bibek-terraform-api-lock-table"
  }
}

generate "provider"{
  path = "provider.tf"
  if_exists = "overwrite"
  contents = <<EOF
    terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}


provider "aws" {
  region                   = "us-east-1"
  shared_credentials_file = "C:/Users/Dell/.aws/credentials"

  default_tags {
    tags = {
      Name = "bibek"
      Creator   = "bkarna65@gmail.com"
      Project   = "Intern"
      Deletable = "Yes"
    }
  }

}
EOF
}

