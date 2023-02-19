resource "aws_route53_record" "component" {
  zone_id = "Z08832833UMKBNNRO3YG"
  name    = "${var.COMPONENT}-dev.roboshop.internal"
  type    = "A"
  ttl     = 10
  records = [aws_spot_instance_request.my_spot_server.private_ip]
}