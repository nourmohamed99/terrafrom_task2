provider "aws" {
  region = var.aws_region
  shared_credentials_files = ["/home/hp/.aws/credentials"]
}

