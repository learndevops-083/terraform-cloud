#Terraform Settings Block
terraform {
  required_version = "~>1.2"
  required_providers {
    aws = {  
       source = "hashicorp/aws"
       version = "~>3.0" // version constraints
     }
  }
}

#Terraform provider Block 
provider "aws" {
   region = var.aws_region
}
