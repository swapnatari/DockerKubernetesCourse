resource "aws_subnet" "subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block
}

resource "aws_subnet" "subnet1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidr_1
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidr_2
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
}

resource "aws_route_table_association" "subnet1_route" {

  subnet_id = aws_subnet.subnet1.id

  route_table_id = var.route_table_id
}


resource "aws_route_table_association" "subnet2_route" {

  subnet_id = aws_subnet.subnet2.id

  route_table_id = var.route_table_id
}