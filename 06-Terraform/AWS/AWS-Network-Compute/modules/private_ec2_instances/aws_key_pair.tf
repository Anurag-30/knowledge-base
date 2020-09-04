resource "null_resource" "make_ssh_keys" {
  provisioner "local-exec" {
    command         = "yes y  |  ssh-keygen -q -t rsa -f private_ec2_key_pair -N '' "
  }
}

data "local_file" "read_pub_content" {
  filename          = "private_ec2_key_pair.pub"
  depends_on        = [null_resource.make_ssh_keys]
}

resource "aws_key_pair" "create_key_pair" {
  key_name          = "terraform-private-ec2-key"
  public_key        = data.local_file.read_pub_content.content
}