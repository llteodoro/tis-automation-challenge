variable "aws_ami-linux" {
    type = map

    default = {
        "us-east-1" = "ami-0c4f7023847b90238" 
    }
}
variable "aws_ami-windows" {
    type = map

    default = {
        "us-east-1" = "ami-02e188c5eabfa5c8d" 
    }
}
variable "aws_region" {
    default = "us-east-1"
  
}

variable "aws_instance" {
    default = "t2.micro"
  
}

variable "aws_security_group" {
  default = "webserver-sg"
}
