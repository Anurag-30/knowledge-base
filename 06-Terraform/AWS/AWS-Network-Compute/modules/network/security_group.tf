resource "aws_security_group" "instances_security_groups" {
  name                =  "allow_access"
  description         =  "Allow ssh inbound traffic"
  vpc_id              =  aws_vpc.main_vpc.id

  ingress {

    description = "Allow-ssh from public"
    from_port         =  0
    to_port           =  22
    protocol          =  "tcp"
    cidr_blocks       =  [aws_vpc.main_vpc.cidr_block,"0.0.0.0/0"]

  }

  egress {

    from_port         =  0
    to_port           =  0
    protocol          =  "-1"
    cidr_blocks       =  ["0.0.0.0/0"]

  }

  tags = {
    Name             =  "allow_access"
  }

}

resource "aws_security_group_rule" "Allow_tcp" {
  depends_on               = [aws_security_group.instances_security_groups]
  from_port                = 0
  protocol                 = "tcp"
  cidr_blocks              = ["0.0.0.0/0",aws_vpc.main_vpc.cidr_block]
  security_group_id        = aws_security_group.instances_security_groups.id
  to_port                  = 80
  type                     = "ingress"
}

resource "aws_security_group" "elb_security_group" {
  name                =  "allow_http_access"
  description         =  "Allow traffic over port 80"
  vpc_id              =  aws_vpc.main_vpc.id

  ingress {

    description = "Allow-http from public"
    from_port         =  0
    to_port           =  80
    protocol          =  "tcp"
    cidr_blocks       =  [aws_vpc.main_vpc.cidr_block,"0.0.0.0/0"]

  }

  egress {

    from_port         =  0
    to_port           =  0
    protocol          =  "-1"
    cidr_blocks       =  ["0.0.0.0/0"]

  }

  tags = {
    Name             =  "allow_http_access"
  }

}



output "security_groups_id" {

  value = aws_security_group.instances_security_groups.id

}

output "security_group_elb" {
  value = aws_security_group.elb_security_group.id
}