data aws_ami "image_id"{

  #owners     = ["aws-marketplace"]  # using ami from Amazon market place , should be self (security practice)
  owners      = ["120116087690"]
  most_recent = true

  filter {
    name      = "name"
    values    = ["Centos 7*"]
  }

  filter {
    name      = "root-device-type"
    values    = ["ebs"]
  }

}

data aws_availability_zones "azs"{
  state = "available"
}


resource "aws_launch_template" "private_ec2_template" {
  name                   = "launch-configuration-private-ec2"
  update_default_version =  true
  image_id               =  data.aws_ami.image_id.image_id
  instance_type          =  var.instance_type
  key_name               =  aws_key_pair.create_key_pair.key_name
  vpc_security_group_ids =  var.aws_security
  user_data              = filebase64("install_nginx.sh")
    block_device_mappings {
      device_name   = "/dev/sdb"
        ebs {
          volume_size = 10
       }
    }
  }



resource "aws_autoscaling_group" "private_ec2" {
  max_size               = 3
  min_size               = 1
  desired_capacity       = 1
  vpc_zone_identifier    = var.private_subnets
  load_balancers         = [var.alb_id]
    launch_template {
      id                 = aws_launch_template.private_ec2_template.id
      version            = "$Latest"
    }
    tag {
      key                 = "Name"
      value               = "Private-Instances"
      propagate_at_launch = true
   }

}


