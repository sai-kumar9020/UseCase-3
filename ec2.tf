resource "aws_instance" "openproject" {
  ami                    = var.ami_id # Amazon Linux 2 AMI (adjust if needed)
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet_1.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = var.key_name # Replace with your key pair

  user_data              = <<-EOF
    #!/bin/bash
    sudo apt update -y
    curl -fsSL https://get.docker.com -o install-docker.sh
    sudo sh install-docker.sh
    sudo usermod -aG docker ubuntu
    docker run -d -p 80:80 \
     -e OPENPROJECT_SECRET_KEY_BASE=secret \
     -e OPENPROJECT_HTTPS=false \
     openproject/openproject:15.4.1

    EOF

  tags = {
    Name = "OpenProject-EC2"
  }
}
