# Security Group

# Obtain User Local Public IP
data "external" "myipaddr" {
  program = ["bash", "-c", "curl -s 'https://ipinfo.io/json'"]
}

resource "aws_security_group" "ec2_security_group" {
  name        = "${var.env}-ec2-security-group"
  description = "Security Group for EC2 Web Servers"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "Allow SSH from MY Public IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${data.external.myipaddr.result.ip}/32"]
  }

  ingress {
    description     = "HTTP from Internet"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_security_group.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.env}-ec2-security-group"
    Environment = var.env
  }
}




# EC2
resource "aws_instance" "web_server" {
  count                  = 2
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet[count.index].id
  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]
  user_data              = var.user_data
  key_name               = var.ssh_key

  tags = {
    Name        = "${var.env}-${var.ec2_name}-${count.index}"
    Environment = var.env
  }
}