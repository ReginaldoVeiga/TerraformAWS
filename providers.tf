terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.1"
    }
  }
}

# Configuração do AWS Provider
provider "aws" {
  region = "us-east-1"
  profile = "aws"
}
