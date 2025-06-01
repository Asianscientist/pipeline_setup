output "public_ip" {
    value = aws_instance.fastapi_server.public_ip
}
output "fastapi_server_public_ip" {
  value = aws_eip.fastapi_eip.public_ip
}