provider "aws" {
  region        = "ap-south-1"
}



resource "null_resource" "test" {

  provisioner "local-exec" {
    command    = <<-EOT
                   yes y | ssh-keygen -q -t rsa -f key-pair -N ''
                  EOT
    }
}

data "local_file" "public_content" {
  filename     = "${path.module}/key-pair.pub"
  depends_on   = [null_resource.test]
}

resource "aws_key_pair" "test" {
  key_name     = "Terraform-dynamic-key-pair"
  public_key   = data.local_file.public_content.content
}


output "public_key_content" {
  value        =  data.local_file.public_content.content
}

