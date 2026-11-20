output "vpc_id" {
  description = "FinServ VPC ID"
  value       = aws_vpc.finserv_vpc.id
}

output "vpc_cidr" {
  description = "FinServ VPC CIDR"
  value       = aws_vpc.finserv_vpc.cidr_block
}

output "public_subnet_id" {
  description = "Public subnet ID"
  value       = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  description = "Private subnet ID"
  value       = aws_subnet.private_subnet.id
}

output "internet_gateway_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.finserv_igw.id
}

output "public_route_table_id" {
  description = "Public route table ID"
  value       = aws_route_table.public_rt.id
}

output "private_route_table_id" {
  description = "Private route table ID"
  value       = aws_route_table.private_rt.id
}