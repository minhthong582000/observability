resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

#
#--- SG for EC2 monitoring instances
#
resource "aws_security_group" "monitoring" {
  name        = "monitoring"
  description = "Allow traffic between monitoring instances"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_default_vpc.default.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
