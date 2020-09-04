variable "public_subnets" {
  type     = set(string)
}

variable "alb_security_group" {
  default = ""
}
