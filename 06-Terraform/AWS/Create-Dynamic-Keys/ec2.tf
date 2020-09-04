data aws_subnet "public_subnets"{

  filter {
    name                      = "tag:Name"
    values                    = ["staging-PrivateSubnet-3"]
  }
}

resource "aws_instance" "test" {
  count                        = 1
  ami                          = "ami-0007417ec76523a33"
  instance_type                = "t2.micro"
  associate_public_ip_address  = true
  subnet_id                    = data.aws_subnet.public_subnets.id
  key_name                     = aws_key_pair.test.key_name
}

output "public_subnets" {
  value = data.aws_subnet.public_subnets.*.id
}