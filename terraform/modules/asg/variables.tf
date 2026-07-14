variable "project_name" {
  description = "Ten du an"
  type        = string
}

variable "public_subnets" {
  description = "Danh sach Subnet de dat may chu"
  type        = list(string)
}

variable "ec2_sg_id" {
  description = "ID cua Security Group bao ve may chu"
  type        = string
}

variable "target_group_arn" {
  description = "ARN cua Target Group de bao voi Load Balancer"
  type        = string
}

variable "key_name" {
  description = "Ten Key Pair de SSH vao"
  type        = string
}

variable "docker_image" {
  description = "Ten image tren Docker Hub"
  type        = string
}