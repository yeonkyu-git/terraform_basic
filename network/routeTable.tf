#? Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.name}-public-rt"
  }
}

resource "aws_route" "public_rt_route" {
  route_table_id            = aws_route_table.public_rt.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.igw.id
  depends_on                = [aws_route_table.public_rt]
}

resource "aws_route_table_association" "public_rt_asso" {
  count = length(aws_subnet.public_subnets)

  subnet_id      = element(aws_subnet.public_subnets, count.index)["id"]
  route_table_id = aws_route_table.public_rt.id
}

#? Private Route Table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.name}-private-rt"
  }
}

resource "aws_route" "private_rt_route" {
  route_table_id            = aws_route_table.private_rt.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id            = aws_nat_gateway.ngw.id
  depends_on                = [aws_route_table.private_rt]
}

resource "aws_route_table_association" "private_rt_asso" {
  count = length(aws_subnet.private_subnets)

  subnet_id      = element(aws_subnet.private_subnets, count.index)["id"]
  route_table_id = aws_route_table.private_rt.id
}