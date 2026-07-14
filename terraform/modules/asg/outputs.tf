output "asg_id" {
  description = "ID Auto Scaling Group"
  value       = aws_autoscaling_group.app_asg.id
}

output "asg_name" {
  description = "Ten Auto Scaling Group"
  value       = aws_autoscaling_group.app_asg.name
}