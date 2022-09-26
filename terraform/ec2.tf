data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "test" {
  key_name   = "test"
  public_key = file("~/.ssh/rsa.pub")
}

resource "aws_instance" "monitoring" {
  count = var.instances_count

  ami               = data.aws_ami.ubuntu.id
  instance_type     = "t3.medium"
  security_groups   = [aws_security_group.monitoring.name]
  availability_zone = "us-east-1a"
  key_name          = aws_key_pair.test.key_name

  root_block_device {
    volume_size = "20"
    volume_type = "gp2"
    encrypted   = true
  }

  tags = {
    Name = "Monitoring-${count.index}"
  }
}
