# Create a VPC to launch our instances into
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"  
  enable_dns_hostnames = true 
  enable_dns_support   = true
  
  tags = {
    Name       = "emre-vpc"     # Changed from "name" to "Name"
    dept       = "AWS"
    costcenter = "CS100"
  }       
}

# Create a subnet inside the VPC with specific availability zone
resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-west-2a"
  
  tags = {
    Name       = "emre-subnet"  # Changed from "name" to "Name"
    dept       = "AWS"
    costcenter = "CS100"
  }
  depends_on = [aws_vpc.main]
}

# Create an Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  
  tags = {
    Name = "emre-igw"          # This one was already correct
  }
}
