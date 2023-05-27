# Variables

variable "env" {
  description = "Environment Name"
  type        = string
}

variable "aws_region" {
  description = "AWS deployment region"
  type        = string
}

variable "ec2_name" {
  description = "EC2 Web Server name"
  type        = string
}

variable "ssh_key" {
  description = "ssh key name"
  type        = string
}

variable "ami" {
  description = "AMI"
  type        = string
}

variable "instance_type" {
  description = "instance type"
  type        = string
}

variable "db_name" {
  description = "The database name"
  type        = string
}

variable "db_username" {
  description = "The master username for the database"
  type        = string
}

variable "db_password" {
  description = "Password for the master DB user"
  type        = string
  sensitive   = true
}

variable "vpc_cidr" {
  type        = string
  description = "This configures the vpc cidr"
}
variable "public_subnet1_az1_cidr" {
  type        = string
  description = "This configures the public subnet1 cidr"
}
variable "public_subnet2_az2_cidr" {
  type        = string
  description = "This configures the public subnet2 cidr"
}
variable "private_subnet1_az1_cidr" {
  type        = string
  description = "This configures the private subnet1 cidr"
}
variable "private_subnet2_az2_cidr" {
  type        = string
  description = "This configures the private subnet2 cidr"
}