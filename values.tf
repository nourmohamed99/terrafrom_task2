variable "aws_region" {
    description = "aws region"
    type =  string
    default = "us-east-1"
}

variable "vpc_cidr" {
    description = "vpc cidr block"
    type = string
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr"{
    description = "public subnet cidr block"
    type = string
    default = "10.0.0.0/24"
}

variable "private_subnet_cidr"{
    description = "private subnet cidr block"
    type = string
    default = "10.0.1.0/24"
}

variable "tag_names" {
    description = "tag names"
    type = map 
    default = {
        "vpc" = "terraform-vpc"
        "public-subnet" = "public-subnet"
        "private-subnet" = "private-subnet"
    }


}
