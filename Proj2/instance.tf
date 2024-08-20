resource "aws_instance" "my_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # Example AMI ID, change as needed
  instance_type = "t2.micro"

  tags = {
    Name = "my-instance"
  }
}
