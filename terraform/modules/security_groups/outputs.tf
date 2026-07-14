output "alb_sg_id" {
    description = "ID cua Security Group cho ALB"
    value = aws_security_group.alb_sg.id
}

output "ec2_sg_id" {
    description = "ID cua Security Group cho EC2"
    value = aws_security_group.ec2_sg.id
}
