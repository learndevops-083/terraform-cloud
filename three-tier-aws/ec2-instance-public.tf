# AWS EC2 Instance Terraform Module
# Bastion Host - EC2 Instance that will be created in VPC Public Subnet
module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~>3.0"
  # insert the 10 required variables here
  name                   = "ec2-public-svr"
  #instance_count         = 5
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  #monitoring             = true
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.sg_public.this_security_group_id]
  tags = {
    Name ="ec2-public-svr"
  }
}

module "ec2_public2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~>3.0"
  # insert the 10 required variables here
  name                   = "ec2-public-svr2"
  #instance_count         = 5
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  #monitoring             = true
  subnet_id              = module.vpc.public_subnets[1]
  vpc_security_group_ids = [module.sg_public.this_security_group_id]
  tags = {
    Name ="ec2-public-svr2"
  }
}