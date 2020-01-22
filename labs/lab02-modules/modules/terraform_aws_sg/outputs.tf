output "sg_id" {
  description = "Security Group Id"
  value       = "${aws_security_group.web-dmz.id}"
}