data aws_availability_zones "azs"{
  state    = "available"
}

data "aws_subnet" "public" {                        // create Map of subnet_id's and corresponding attributes
  for_each   = var.public_subnets
  id         = each.value
}


locals {                                           // create a map with availability zones and corresponding subnets_id's
    availability_zone_subnets = {
      for s in data.aws_subnet.public : s.availability_zone => s.id...
    }
}


resource "aws_elb" "load_balancer" {
  name           = "LoadBalancer-Terraform-App"
  subnets        =  [for subnet_ids in local.availability_zone_subnets : subnet_ids[0]]  // pick a subnet from each availability_zone
  security_groups = [var.alb_security_group]
    listener {
      instance_port     = 80
      instance_protocol = "http"
      lb_port           = 80
      lb_protocol       = "http"
    }
   health_check {
     healthy_threshold = 5
     interval = 30
     target = "http:80/index.html"
     timeout = 10
     unhealthy_threshold= 5
   }
}




output "subnets" {
  value = local.availability_zone_subnets
}

output "alb_id" {
  value = aws_elb.load_balancer.id
}

output "alb_ame" {
  value = aws_elb.load_balancer.dns_name
}