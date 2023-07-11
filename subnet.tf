resource "aws_subnet" "public" {
    cidr_block = var.public_subnet_cidr
    vpc_id = aws_vpc.my_vpc.id
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1a"
    
    tags = {
        Name = var.tag_names["public-subnet"]
    }
}

resource "aws_subnet" "private" {
    cidr_block = var.private_subnet_cidr
    vpc_id = aws_vpc.my_vpc.id
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1b"
    tags = {
        Name = var.tag_names["private-subnet"]
    }
    
}