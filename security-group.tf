resource "aws_security_group" "application-sg" {
  name = "ALB_Security-group"
  description = "Allow HTTP and HTTPS inbound traffic"
  vpc_id = aws_vpc.my-vpc.id 

  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  
}
  ingress {
    from_port   = var.https_port
    to_port     = var.https_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  
}

  egress {
    from_port   = var.egress_port
    to_port     = var.egress_port
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}