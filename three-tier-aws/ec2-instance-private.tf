# AWS EC2 Instance Terraform Module
# EC2 Instances that will be created in VPC Private Subnets
module "ec2_private" {
  depends_on = [ module.vpc ] # this depends on is meta-argument function that means that until the main vpc is created before this private ec2 instance will be created
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~>3.0"
   #for_each = toset([ module.vpc.private_subnets[0],module.vpc.private_subnets[1] ])
  for_each = toset(["0", "1"])
  # insert the 10 required variables here
  name                   = "ec2-private-svr"
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  #monitoring             = true
  vpc_security_group_ids = [module.private_sg.this_security_group_id]
  
 
 #for_each = toset([" module.vpc.private_subnets[0]","module.vpc.private_subnets[1]"])
 subnet_id =  element(module.vpc.private_subnets, tonumber(each.key))

  #instance_count   = var.private_instance_count
  user_data = file("${path.module}/app1-install.sh")
  tags = {
    Name = "ec2-private-svr"
  }
}
 