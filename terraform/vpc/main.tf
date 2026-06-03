resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
}
resource "aws_internet_gateway" "igw" {

  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "swapna-igw"
  }
}
resource "aws_route_table" "public_rt" {

  vpc_id = aws_vpc.vpc.id


  route {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.igw.id
  }
}