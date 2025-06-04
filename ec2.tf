resource "aws_instance" "openproject" {
  ami                    = var.ami_id # Amazon Linux 2 AMI (adjust if needed)
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet_1
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = var.key_name # Replace with your key pair

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              systemctl start docker
              systemctl enable docker
              docker run -d -p 8080:80 openproject/community:latest
              EOF

  tags = {
    Name = "OpenProject-EC2"
  }
}
