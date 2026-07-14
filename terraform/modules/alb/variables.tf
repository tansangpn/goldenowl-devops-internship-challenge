variable "project_name" {
  description = "Ten du an"
  type = string
}
variable "vpc_id" {
  description = "VPC ID"
  type = string
}
variable "public_subnets" {
  description = "Danh sach ID cua cac Public Subnet de dat ALB"
  type = list(string)  
}
variable "alb_sg_id" {
  description = "ID cua Security Group cho ALB"
  type = string
}
