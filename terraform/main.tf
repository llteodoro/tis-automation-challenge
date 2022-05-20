terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
}
 required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}

resource "aws_instance" "Vm-Ansible-Agent" {
  ami           = lookup(var.aws_ami-linux,var.aws_region) # us-east-1
  instance_type = var.aws_instance
  key_name = "challenge-key"

  tags = {
    Name = "vm-ansible-agent"
  }
  depends_on = [
    aws_security_group.webserver-sg
  ]
  vpc_security_group_ids = ["${aws_security_group.webserver-sg.id}"] 

}
resource "aws_instance" "Vm-Linux" {
  count = 2
  ami           = lookup(var.aws_ami-linux,var.aws_region) # us-east-1
  instance_type = var.aws_instance
  key_name = "challenge-key"

  tags = {
    Name = "vm-linux-${count.index}"
    Group = "Webserver-Linux"
  }
  depends_on = [
    aws_security_group.webserver-sg
  ]
  vpc_security_group_ids = ["${aws_security_group.webserver-sg.id}"] 
}

resource "aws_instance" "Vm-Windows" {
  count = 2
  ami           = lookup(var.aws_ami-windows,var.aws_region) # us-east-1
  instance_type = var.aws_instance
  key_name = "challenge-key"
  

  tags = {
    Name = "vm-windows-${count.index}"
    Group = "Webserver-Windows"
  }
  depends_on = [
    aws_security_group.webserver-sg
  ]
  vpc_security_group_ids = ["${aws_security_group.webserver-sg.id}"] 
}


