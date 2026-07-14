# Tao ALB
resource "aws_lb" "main" {
  name = "${var.project_name}-alb"
  internal = false #mo ra Internet
  load_balancer_type = "application"
  security_groups = [var.alb_sg_id]
  subnets = var.public_subnets

  tags = {
    Name = "${var.project_name}-alb"
  }
}

resource "aws_lb_target_group" "app_tg" {
  name = "${var.project_name}-tg"
  port = 3000
  protocol = "HTTP"
  vpc_id = var.vpc_id
  target_type = "instance"

  #Kiem tra co con song kh?
  health_check {
    path = "/"
    protocol = "HTTP"
    matcher = "200" #Tra ve 200 neu web con song
    interval = 30
    timeout = 5 
    healthy_threshold = 2
    unhealthy_threshold = 2
  }
  tags = {
    Name = "${var.project_name}-tg"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.main.arn
  port = "80"
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}
