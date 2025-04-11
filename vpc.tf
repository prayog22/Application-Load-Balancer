resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "my-vpc"
  }  
}

resource "aws_subnet" "my-subnet-1a" {

  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "my-subnet-1a"
  }
}

resource "aws_subnet" "my-subnet-1b" {

  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "my-subnet-1b"
  }
}

resource "aws_internet_gateway" "igw"  {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    name = "igw"
  }
  
}

resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.my-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "rtb"
  }
}

resource "aws_route_table_association" "rta_subnet_1a" {
  subnet_id = aws_subnet.my-subnet-1a.id
  route_table_id = aws_route_table.rtb.id
}

resource "aws_route_table_association" "rta_subnet_1b" {
  subnet_id = aws_subnet.my-subnet-1b.id
  route_table_id = aws_route_table.rtb.id
}
