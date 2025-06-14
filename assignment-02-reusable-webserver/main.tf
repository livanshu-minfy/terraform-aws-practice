provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "vpc_livanshu" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.vpc_livanshu.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true
}
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc_livanshu.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_livanshu.id
  }
  depends_on = [aws_internet_gateway.igw_livanshu]
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_internet_gateway" "igw_livanshu" {
  vpc_id = aws_vpc.vpc_livanshu.id
}

resource "aws_security_group" "web_sg_livanshu" {
  description = "Allow HTTP"
  vpc_id = aws_vpc.vpc_livanshu.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "web_server_livanshu" {
  source = "./modules/ec2_instance"
  instance_type = var.instance_type
  ami_id = var.web_server_ami
  subnet_id = aws_subnet.public.id
  security_group_ids = [aws_security_group.web_sg_livanshu.id]
  tags = {
    Name = "WebServer-from-Module"
  }
}
