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
  region  = var.regiao_aws
}

resource "aws_instance" "app_server" {
  ami           = "ami-0c4f7023847b90238" #"ami-0aeb7c931a5a61206"
  instance_type = var.instancia
  key_name = var.chave

  tags = {
    Name = "Terceira instância"
  }
}

resource "aws_key_pair" "chave-SSH" {
    key_name = var.chave
    public_key = file("${var.chave}.pub")
  
}
output "IP_publico" {
  value = aws_instance.app_server.public_ip