resource "aws_instance" "my_instance" {
  ami           = "ami-12345678"  # Replace with the desired AMI ID
  instance_type = "t2.micro"
  key_name      = "my-key-pair"
  subnet_id     = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
}
