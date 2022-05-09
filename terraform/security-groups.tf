resource "aws_security_group" "webserver-sg" {
    name = "webserver-sg"
    description = "Access group for web servers"
    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
  }
   ingress {
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
  }
   ingress {
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
  }
   ingress {
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
  }   
    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        from_port   = 3389
        to_port     = 3389
        protocol    = "tcp"
}
    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        from_port   = 3389
        to_port     = 3389
        protocol    = "udp"
}
    egress {
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        from_port = 0
        to_port = 0
        protocol = "-1"
    }

    tags = {
      Name = "web-server-access-group"
    }
}