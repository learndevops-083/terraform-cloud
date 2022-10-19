#Terraform Resource Block
resource "aws_instance" "ec2-demo1" {
    ami = data.aws_ami.amzlinux2.id
    instance_type = var.aws_instance_type
    user_data = file("${path.module}/app1-install.sh")
    key_name = var.instance_keypair
    vpc_security_group_ids = [ aws_security_group.ssh.id,aws_security_group.web.id ]
    tags = {
      "Name" = "ec2-demo1"
     }
  
}
