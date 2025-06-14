resource "aws_instance" "ec2_livanshu" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  tags                   = var.tags

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y httpd
    sudo systemctl start httpd
    sudo systemctl enable httpd
    echo "<h1>Hello World from $(hostname -f) -- livanshu</h1>" | sudo tee /var/www/html/index.html
  EOF
}
