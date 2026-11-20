# --------------------------------
# 1. VPC
# --------------------------------

resource "aws_vpc" "finserv_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "finserv-vpc"
  }
}

# --------------------------------
# 2. Public Subnet
# --------------------------------

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.finserv_vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "finserv-public-subnet"
    Tier = "Public"
  }
}

# --------------------------------
# 3. Private Subnet
# --------------------------------

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.finserv_vpc.id
  cidr_block              = var.private_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = false

  tags = {
    Name = "finserv-private-subnet"
    Tier = "Private"
  }
}

# --------------------------------
# 4. Internet Gateway
# --------------------------------

resource "aws_internet_gateway" "finserv_igw" {
  vpc_id = aws_vpc.finserv_vpc.id

  tags = {
    Name = "finserv-internet-gateway"
  }
}

# --------------------------------
# 5. Public Route Table
# --------------------------------

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.finserv_vpc.id

  tags = {
    Name = "finserv-public-rt"
  }
}

resource "aws_route" "public_internet_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.finserv_igw.id
}

# --------------------------------
# 6. Private Route Table
# --------------------------------

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.finserv_vpc.id

  tags = {
    Name = "finserv-private-rt"
  }
}

# No internet route for private subnet.
# NAT Gateway will not be created.

# --------------------------------
# 7. Route Table Associations
# --------------------------------

resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}