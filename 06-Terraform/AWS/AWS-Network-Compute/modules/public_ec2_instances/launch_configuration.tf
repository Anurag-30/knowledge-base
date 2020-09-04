resource "aws_launch_configuration" "public_instance" {
  name                         =   "${var.env_name}-instances-launch-config"
  image_id                     =    data.aws_ami.image_id.image_id
  instance_type                =    var.instance_type
  security_groups              =    var.aws_security
  associate_public_ip_address  =    true
  key_name                     =    aws_key_pair.create_aws_key_pair.key_name
  user_data                    =    <<-EOF
                                    #! /bin/bash
                                    sudo yum install epel-release -y
                                    sudo yum install git -y
                                    EOF
      root_block_device {
        volume_size = 10
      }

      ebs_block_device {
        device_name = "/dev/sdb"
        volume_type = "gp2"
       volume_size = 5
     }
}

resource "aws_autoscaling_group" "public_instances" {
  max_size                  = 3
  min_size                  = 1
  desired_capacity          = 1
  launch_configuration      = aws_launch_configuration.public_instance.name
  vpc_zone_identifier       = var.public_subnets
  health_check_grace_period = 300
  health_check_type         = "EC2"

  tag {
    key                     = "Name"
    propagate_at_launch     = true
    value                   = "Public-Instances"
  }
}

