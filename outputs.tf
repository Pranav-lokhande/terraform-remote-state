output "vpc_id" {
  description = "VPC ID"
  value       = module.networking.vpc_id
}

output "subnet_id" {
  description = "Public subnet ID"
  value       = module.networking.subnet_id
}

output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.web.id
}

output "public_ip" {
  description = "Public IP of the Nginx server"
  value       = aws_instance.web.public_ip
}

output "website_url" {
  description = "Nginx website URL"
  value       = "http://${aws_instance.web.public_ip}"
}