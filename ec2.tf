data "aws_ami" "ubuntu" {

    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"]
}

resource "aws_instance" "public_instance" {
  ami = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  key_name = "sprints-key"
  subnet_id = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.public-sg.id]
  associate_public_ip_address = true
  user_data = "${file("script.sh")}"

  tags = {
    Name = "public_instance"
  }

}

resource "aws_instance" "private_instance" {
  ami = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  key_name = "sprints-key"
  subnet_id = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.private-sg.id]
  associate_public_ip_address = false
  user_data = "${file("script.sh")}"

  tags = {
    Name = "private_instance"
  }

}