output vpc_id {
  value = aws_vpc.vpc.id
}
output "route_table_id" {
  value = aws_route_table.public_rt.id
}