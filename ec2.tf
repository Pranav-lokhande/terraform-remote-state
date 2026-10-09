data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  lifecycle {
    create_before_destroy = true
  }

  subnet_id              = module.networking.subnet_id
  vpc_security_group_ids = [module.networking.security_group_id]

  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y nginx
              systemctl enable nginx
              systemctl start nginx
              EOF

  tags = merge(local.common_tags, {
    Name = "terraform-nginx-server"
  })
}