output "alb_dns_name" {
  description = "link truy cap vao trang web"
  value = aws_lb.main.dns_name
}
output "target_group_arn" {
  description = "ARN cua Target Group de ASG gan may chu vao"
  value = aws_lb_target_group.app_tg.arn
}
