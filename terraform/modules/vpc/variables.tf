variable "project_name" {
    description = "ten cua du an gan tag"
    type = string
}
variable "vpc_cidr" {
  description = "Dai IP cho toan bo mang VPC"
  type = string 
}
variable "public_subnet_1_cidr" {
  description = "Dai IP cho Subnet Public 1"
  type = string  
}
variable "public_subnet_2_cidr" {
  description = "Dai IP cho Subnet Public 2"
  type = string
}
variable "az_1" {
  description = "Availability Zone 1"
  type = string
}
variable "az_2" {
  description = "Availability Zone 2"
  type = string
}
