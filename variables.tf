variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Map of CIDR blocks for public subnets"
  type        = map(string)
}

variable "private_subnet_cidrs" {
  description = "Map of CIDR blocks for private subnets"
  type        = map(string)
}

variable "availability_zones" {
  description = "Map of availability zones for each subnet"
  type        = map(string)
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Map of instance types for each EC2 instance"
  type        = map(string)
}

variable "desired_capacity" {
  description = "Desired capacity for the Auto Scaling group"
  type        = number
  default     = 2
}
