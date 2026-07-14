output "website_url" {
  description = "Đường link truy cập website (Load Balancer DNS)"
  value       = "http://${module.alb.alb_dns_name}"
}