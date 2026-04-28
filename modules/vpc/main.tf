resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "my_vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  for_each = var.public_subnet_cidrs
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = each.value
  availability_zone = var.availability_zones[each.key]
  tags = {
    Name = "public_subnet_${each.key}"
  }
}

resource "aws_subnet" "private_subnet" {
  for_each = var.private_subnet_cidrs
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = each.value
  availability_zone = var.availability_zones[each.key]
  tags = {
    Name = "private_subnet_${each.key}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "my_igw"
  }
}

resource "aws_eip" "nat" {
  vpc = true
  tags = {
    Name = "my_eip"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet["subnet1"].id
  tags = {
    Name = "gw NAT"
  }
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "public" {
  for_each = aws_subnet.public_subnet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = {
    Name = "private-rt"
  }
}

resource "aws_route_table_association" "private" {
  for_each = aws_subnet.private_subnet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private.id
}
