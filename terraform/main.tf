provider "aws" {
"main": "server.js",
"scripts": {
"start": "node server.js"
}
}
PKG


chown -R ec2-user:ec2-user /home/ec2-user/app
cd /home/ec2-user/app
npm install --production || true


# run app in background
nohup node server.js > /var/log/oneclick-app.log 2>&1 &
EOF
)


tag_specifications {
resource_type = "instance"
tags = { Name = "oneclick-instance" }
}
}


# --- Auto Scaling Group ---
resource "aws_autoscaling_group" "asg" {
name = "oneclick-asg"
desired_capacity = var.desired_capacity
min_size = var.min_size
max_size = var.max_size
launch_template {
id = aws_launch_template.lt.id
version = "$Latest"
}
vpc_zone_identifier = values(aws_subnet.private).*id
target_group_arns = [aws_lb_target_group.tg.arn]
health_check_type = "ELB"
health_check_grace_period = 30
tag {
key = "Name"
value = "oneclick-asg-instance"
propagate_at_launch = true
}
}


# --- CloudWatch Log Group (optional) ---
resource "aws_cloudwatch_log_group" "app" {
name = "/oneclick/app"
retention_in_days = 7
}


# --- Outputs ---
output "alb_dns_name" {
description = "ALB DNS name to use for testing"
value = aws_lb.alb.dns_name
}


output "vpc_id" {
value = aws_vpc.this.id
}
