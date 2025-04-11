resource "aws_lb" "Application-lb" {
  load_balancer_type = "application"
  name               = "Application-lb"
  internal = false
  security_groups = [ aws_security_group.application-sg.id ]
  subnets = [ aws_subnet.my-subnet-1a.id, aws_subnet.my-subnet-1b.id ]
  enable_deletion_protection = false
  ip_address_type = "ipv4"

  tags = {
    Name = "Application-lb"
  }
}

resource "aws_lb_target_group" "Application-Target" {
  name = "application-target-group"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.my-vpc.id 
  ip_address_type = "ipv4"
  protocol_version = "HTTP1"
  health_check {
    protocol = "HTTP"
    path = "/"
    healthy_threshold = 5
    unhealthy_threshold = 2
    timeout = 5
    interval = 30    
  }
  
}

resource "aws_lb_target_group_attachment" "Target-attach-1" {
  target_group_arn = aws_lb_target_group.Application-Target.arn
  target_id = aws_instance.ALB-1.id 
}

resource "aws_lb_target_group_attachment" "Target-attach-2" {
  target_group_arn = aws_lb_target_group.Application-Target.arn
  target_id = aws_instance.ALB-2.id 
}
resource "aws_lb_listener" "Application-listener" {
  load_balancer_arn = aws_lb.Application-lb.arn
  port = "80"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.Application-Target.arn
  }
}