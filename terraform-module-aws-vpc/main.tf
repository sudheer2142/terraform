resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = merge (
    var.common_tags,var.vpc_tags
  )
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.common_tags,
    var.igw_tags
  )
}

resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr[count.index]
  availability_zone = var.azs[count.index]
  tags = merge(
    var.common_tags,
    {
        Name = var.public_subnet_names[count.index]
    }
  )
}

resource "aws_subnet" "private" {
count = length(var.private_subnet_cidr)
vpc_id =  aws_vpc.main.id
cidr_block = var.private_subnet_cidr[count.index]
availability_zone = var.azs[count.index]
tags = merger(
  var.common_tags,
  {
    Name = var.private_subnet_names[count.index]
  }
)
}

resource "aws_subnet" "database" {
count = length(var.database_subnet_cidr)
vpc_id =  aws_vpc.main.id
cidr_block = var.database_subnet_cidr[count.index]
availability_zone = var.azs[count.index]
tags = merger(
  var.common_tags,
  {
    Name = var.database_subnet_names[count.index]
  }
)
}

# here we are adding the 
resource "aws_route" "public" {
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.main.id
  # this is we are saying explicitly below route table has dependency
  depends_on  = [aws_route_table.public]
  
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.common_tags,
    var.public_route_table_tags
  )
}


resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.common_tags,
    var.public_route_table_tags
  )
}
# associate public route table with public subnets
# public-route-table --> public-1a subnet
# public-route-table --> public-1b subnet
resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidr)
  subnet_id      = element(aws_subnet.public[*].id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.private_route_table_tags
  )
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnet_cidr)
  subnet_id      = element(aws_subnet.private[*].id, count.index)
  route_table_id = aws_route_table.private.id
}


resource "aws_route_table" "database" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.database_route_table_tags
  )
}

resource "aws_route_table_association" "database" {
  count = length(var.database_subnet_cidr)
  subnet_id      = element(aws_subnet.database[*].id, count.index)
  route_table_id = aws_route_table.database.id
}