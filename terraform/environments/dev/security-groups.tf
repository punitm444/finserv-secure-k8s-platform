
# Jenkins Security Group
resource "aws_security_group" "jenkins_sg" {
  name        = "finserv-jenkins-sg"
  description = "Restricted access for Jenkins server"
  vpc_id      = aws_vpc.finserv_vpc.id

  ingress {
    description = "SSH from administrator IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.admin_cidrs
  }

  ingress {
    description = "Jenkins web interface from administrator IP"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = var.admin_cidrs
  }

  egress {
    description = "Outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "finserv-jenkins-sg"
  }
}

# Kubernetes Security Group
resource "aws_security_group" "k3s_sg" {
  name        = "finserv-k3s-sg"
  description = "Restricted access for K3s Kubernetes node"
  vpc_id      = aws_vpc.finserv_vpc.id

  ingress {
    description = "SSH from administrator IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.admin_cidrs
  }

  ingress {
    description     = "K3s API from Jenkins security group"
    from_port       = 6443
    to_port         = 6443
    protocol        = "tcp"
    security_groups = [aws_security_group.jenkins_sg.id]
  }

  ingress {
    description = "HTTP application traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.admin_cidrs
  }

  ingress {
    description = "Demo application traffic"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = var.admin_cidrs
  }

  ingress {
    description = "K3s node communication"
    from_port   = 10250
    to_port     = 10250
    protocol    = "tcp"
    self        = true
  }

  egress {
    description = "Outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "finserv-k3s-sg"
  }
}
