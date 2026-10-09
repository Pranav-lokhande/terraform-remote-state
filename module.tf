module "networking" {
  source = "./modules/networking"

  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
  project_name       = local.project_name
  common_tags        = local.common_tags
}

module "ec2" {
  source = "./modules/ec2"

  ami_id            = data.aws_ami.ubuntu.id
  instance_type     = var.instance_type
  subnet_id         = module.networking.subnet_id
  security_group_id = module.networking.security_group_id
  common_tags       = local.common_tags
}