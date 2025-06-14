resource "aws_instance" "web_server" {
  ami=var.ami_id
  instance_type=var.instance_type
  subnet_id=aws_subnet.public_subnet.id
  vpc_security_group_ids=[aws_security_group.web_sg.id]
  associate_public_ip_address=true
  key_name=var.key_name

  user_data = <<-EOF
   #!/bin/bash
    yum update -y
    yum install -y httpd mysql
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Hello from Two-Tier architecture -- livanshu</h1>" > /var/www/html/index.html
    EOF

  tags = {
    Name="day-two-livanshu-web-server"
  }
}

resource "aws_db_instance" "database" {
  allocated_storage=20
  storage_type="gp2"
  engine="mysql"
  engine_version="8.0.36"
  instance_class="db.t2.micro"
  db_name="livanshu_database"
  username=var.db_username
  password=var.db_password
  skip_final_snapshot=true
  publicly_accessible=false
  db_subnet_group_name=aws_db_subnet_group.db_subnets.id
  vpc_security_group_ids=[aws_security_group.db_sg.id]
}

resource "aws_db_subnet_group" "db_subnets" {
  name="day-two-livanshu-subnet-group"
  subnet_ids=[aws_subnet.private_subnet.id]
}