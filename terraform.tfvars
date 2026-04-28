vpc_cidr = "10.0.0.0/16"

public_subnet_cidrs = tomap({
  subnet1 = "10.0.1.0/24"
  subnet2 = "10.0.2.0/24"
})
private_subnet_cidrs = tomap({
  subnet3 = "10.0.3.0/24"
  subnet4 = "10.0.4.0/24"
})

ami_id = "ami-01ef747f983799d6f"

instance_type = tomap({
  subnet1 = "t2.micro"
  subnet2 = "t2.micro"
})

desired_capacity = 2

aws_region = "us-east-1"
availability_zones = tomap({
  subnet1 = "us-east-1a"
  subnet2 = "us-east-1b"
  subnet3 = "us-east-1a"
  subnet4 = "us-east-1b"
})
