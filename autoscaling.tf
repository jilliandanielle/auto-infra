resource "aws_launch_template" "my_launch_template" {
  name_prefix   = "my-launch-template"
  image_id      = "ami-12345678"  # Replace with the desired AMI ID
  instance_type = "t2.micro"
  key_name      = "my-key-pair"
  security_groups = [aws_security_group.my_security_group.id]
}

resource "aws_autoscaling_group" "my_auto_scaling_group" {
  name                     = "my-auto-scaling-group"
  min_size                 = 2
  max_size                 = 4
  desired_capacity         = 2
  launch_template {
    id      = aws_launch_template.my_launch_template.id
    version = "$Latest"
  }
  vpc_zone_identifier      = [aws_subnet.public_subnet.id]
  target_group_arns        = [aws_lb_target_group.my_target_group.arn]
  health_check_type        = "ELB"
}
