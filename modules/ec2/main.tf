resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y nginx
              systemctl enable nginx
              systemctl start nginx
              EOF

  tags = merge(var.common_tags, {
    Name = "terraform-nginx-server"
  })
}