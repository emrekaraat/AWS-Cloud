# Create a VPC to launch our instances into
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"  
  enable_dns_hostnames = true 
  enable_dns_support = true
  
  tags       =  {
    name     = "emre-vpc"
    dept     = "AWS"
    costcenter = "CS100"
  }       
}

# create a subnetinside the VPC
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"
  
  tags       =  {
    name     = "emre-subnet"
    dept     = "AWS"
    costcenter = "CS100"
  }
  depends_on = [aws_vpc.main]
}
