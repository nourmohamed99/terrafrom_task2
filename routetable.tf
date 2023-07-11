resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public route table"
  }
}

resource "aws_route_table_association" "PublicRtassociation" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name = "private route table"
  }
}
resource "aws_route_table_association" "PrivateRtassociation" {
    subnet_id = "${aws_subnet.private.id}"
    route_table_id = "${aws_route_table.private_rt.id}"
}