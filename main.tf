# Modules
module "create_two_tier_aws" {
  source = "./modules"

  env                       = var.env
  aws_region                = var.aws_region
  vpc_cidr_block            = var.vpc_cidr
  public_subnet_cidr_block  = [var.public_subnet1_az1_cidr, var.public_subnet2_az2_cidr]
  private_subnet_cidr_block = [var.private_subnet1_az1_cidr, var.private_subnet2_az2_cidr]

  ec2_name = var.ec2_name
  ssh_key  = var.ssh_key
  ami = var.ami
  instance_type  = var.instance_type

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}