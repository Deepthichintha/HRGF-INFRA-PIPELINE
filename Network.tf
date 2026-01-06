resource "aws_vpc" "eks" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "eks-vpc"
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.eks.id
}


resource "aws_subnet" "public" {
  count  = 2
  vpc_id = aws_vpc.eks.id
  cidr_block = element(
    ["10.0.1.0/24", "10.0.2.0/24"],
    count.index
  )
  availability_zone = element(
    ["us-east-1a", "us-east-1b"],
    count.index
  )
  map_public_ip_on_launch = true

  tags = {
    Name                     = "eks-public-subnet-${count.index}"
    "kubernetes.io/role/elb" = "1"
  }
}



resource "aws_route_table" "public" {
  vpc_id = aws_vpc.eks.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_assoc" {
  count          = 2
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}







