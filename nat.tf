resource "aws_eip" "nat_eip" {
    vpc = true
    depends_on = [aws_internet_gateway.igw]
    tags = {
        Name = "NAT Gateway EIP"
    }
}

resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id = aws_subnet.public.id

    tags = {

        Name = "sprints NAT Gateway"
    }

}