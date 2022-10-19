#input Variables
# AWS Region
 variable "aws_region"{ 
    description = "Region to provision resources"
    type = string
    default = "us-east-1"
 }

 #AWS Ec2 Instance Type
 variable "instance_type"{ 
    description = "EC2 Instance type"
    type = string
    default = "t2.micro"
    
 }

 #AWS EC2 Instance Key Pair
 variable "instance_keypair" {
    description = "AWS EC2 key pair for ssh access"
    type = string
    default ="terraform-key" 
    sensitive = true
 }
    
  /*  #AWS EC2 Instance Type -list 
    variable "instance_type_list" { 
      description = "Ec2 Instance Type"
      type = list(string)
      default = [ "t1.micro","t2.micro","t3.micro" ]
    }
  */
   
   /* #AWS Ec2 Instance Type - Map
    variable "instance_type_map" {
      description = "EC2 Instance Type"
      type = map(string)
      default = {
        "dev" = "t3.micro"
         "qa" = "t3.small"
         "prod" = "t3.large"
      }
    
    }
    */
