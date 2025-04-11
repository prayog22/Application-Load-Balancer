variable "region" {
  type = string
  default = "us-east-1"
}

variable "aws_access_key" {
  type = string
  sensitive = true
}

variable "aws_secret_key" {
  type = string
  sensitive = true
}

variable "ami" {
  type = string
  default = "ami-0cf10cdf9fcd62d37"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
  default = "Tools"
}

variable "http_port" {
  type = number
  default = 80
}

variable "https_port" {
  type = number
  default = 443
}

variable "egress_port" {
  type = number
  default = 0
}