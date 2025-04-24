output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnet[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnet[*].id
}


output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "container_sg_id" {
  value = aws_security_group.container_sg.id
}
