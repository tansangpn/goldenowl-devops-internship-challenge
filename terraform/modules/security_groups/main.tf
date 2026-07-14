#Tuong lua cho LB
resource "aws_security_group" "alb_sg" {
  name = "${var.project_name}-alb-sg"
  description = "Security Group cho Application Load Balancer"
  vpc_id = var.vpc_id

  #cho phep mn truy cap web (http)  
  ingress{
    description = "Allow HTTP from anywhere"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #cho phep gui du lieu ra ngoai  
  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-alb-sg"
  }
}

#Tuong lua cho EC2 chay Docker
resource "aws_security_group" "ec2_sg" {
  name = "${var.project_name}-ec2-sg"
  description = "Security Group cho EC2 Instances"
  vpc_id = var.vpc_id

  #Chi nhan traffic tu LB truyen vao cong 3000
  ingress{
    description = "Allow traffic from ALB on port 3000"
    from_port = 3000
    to_port = 3000
    security_groups = [aws_security_group.alb_sg.id]
  }
  #Mo cong 22 de co the SSH vao may chu sua loi
  ingress{
    description = "Allow SSH from anywhere"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #Cho phep ket noi Internet de keo Docker image ve
  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  } 

  tags = {
    Name ="${var.project_name}-ec2-sg"
  }
}
