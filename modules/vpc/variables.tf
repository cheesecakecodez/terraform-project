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
