resource "aws_vpc" "myvpc" {
    cidr_block = var.cidr
}


resource "aws_subnet" "sub1" {
    vpc_id = aws_vpc_.myvpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a" 
    map_public_ip_on_launch = true
}



resource "aws_subnet" "sub2" {
    vpc_id = aws_vpc_.myvpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1b" 
    map_public_ip_on_launch = true
}



resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.myvpc.id
}

resource "aws_route_table" "myrt" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block =  "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}