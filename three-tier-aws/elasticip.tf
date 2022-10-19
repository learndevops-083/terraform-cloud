/*# Create Elastic IP for Bastion Host
# Resource - depends_on Meta-Argument
resource "aws_eip" "Elastic_eip" {
  depends_on = [ module.ec2_public, module.vpc ]
  instance = module.ec2_public.id[0]
  vpc      = true
  tags = {
    Name = "Elastic-ip-publicinterface-server"
  }
} */