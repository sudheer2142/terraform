output "public_ip"{
    value=aws_instance.my-first-ec2.public_ip
}

output "private_ips" {
  value = aws_instance.conditions[*].private_ip
  # this * denotest the wild card loading of data
}