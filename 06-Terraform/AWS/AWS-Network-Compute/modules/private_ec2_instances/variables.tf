variable "instance_type" {
  default = "t2.micro"
}

variable "private_subnets" {

}

variable "aws_security" {
  type = list
}

variable "public_subnets" {
  default = ""
}

variable "alb_id" {
  default = ""
}