#provider
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}
provider "aws" {
  region     = "ap-northeast-1" #AWS Region
}



#Monitoring Account
module "Monitoring_account" {
  source = "./Monitoring-Account-Module"
}
