resource "aws_instance" "ALB-1" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  user_data = file("install-apache.sh")
  subnet_id = aws_subnet.my-subnet-1a.id
  vpc_security_group_ids = [ aws_security_group.application-sg.id ]
  associate_public_ip_address = true
  tags = {
    Name = "ALB-1"
  }

}

resource "aws_instance" "ALB-2" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  user_data = file("install-apache.sh")
  subnet_id = aws_subnet.my-subnet-1b.id
  vpc_security_group_ids = [ aws_security_group.application-sg.id ]
  associate_public_ip_address = true
  tags = {
    Name = "ALB-2"
  }

}