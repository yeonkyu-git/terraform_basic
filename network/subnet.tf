resource "aws_subnet" "public_subnets" {
  count  = length(var.public_subnets)

  vpc_id     = aws_vpc.vpc.id
  availability_zone = element(var.public_subnets, count.index)["availabilityZone"]
  cidr_block = element(var.public_subnets, count.index)["cidr"]

  tags = {
    Name = "${var.name}-public-subnet-${count.index+1}"
  }
}

resource "aws_subnet" "private_subnets" {
  count  = length(var.private_subnets)

  vpc_id     = aws_vpc.vpc.id
  availability_zone = element(var.private_subnets, count.index)["availabilityZone"]
  cidr_block = element(var.private_subnets, count.index)["cidr"]

  tags = {
    Name = "${var.name}-private-subnet-${count.index+1}"
  }
}