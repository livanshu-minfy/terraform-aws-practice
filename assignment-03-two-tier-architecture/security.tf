provider "aws" {
  region=var.aws_region
}

resource "aws_vpc" "main_vpc" {
  cidr_block="10.0.0.0/16"

  tags = {
    Name="day-two-livanshu-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id=aws_vpc.main_vpc.id

  tags = {
    Name="day-two-livanshu-igw"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id=aws_vpc.main_vpc.id
  cidr_block="10.0.1.0/24"
  map_public_ip_on_launch=true
}

resource "aws_subnet" "private_subnet" {
  vpc_id=aws_vpc.main_vpc.id
  cidr_block="10.0.2.0/24"
}

resource "aws_route_table" "public_rt" {
  vpc_id=aws_vpc.main_vpc.id

  route {
    cidr_block="0.0.0.0/0"
    gateway_id=aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id=aws_subnet.public_subnet.id
  route_table_id=aws_route_table.public_rt.id
}

resource "aws_eip" "nat_eip" {
  domain="vpc"
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id=aws_eip.nat_eip.id
  subnet_id=aws_subnet.public_subnet.id
}

resource "aws_route_table" "private_rt" {
  vpc_id=aws_vpc.main_vpc.id

  route {
    cidr_block="0.0.0.0/0"
    nat_gateway_id=aws_nat_gateway.nat_gw.id
  }
}

resource "aws_route_table_association" "private_assoc" {
  subnet_id=aws_subnet.private_subnet.id
  route_table_id=aws_route_table.private_rt.id
}