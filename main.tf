resource "aws_instance" "node1" {
  ami           = var.os
  instance_type = var.size
  security_groups = [aws_security_group.TF_SG.name]
  provider = aws.sg
  key_name = "tf-key"

  tags = {
    Name = "node-1"
  }
}

resource "aws_security_group" "TF_SG" {
  name        = "sg using terraform"
  description = "sg using terraform"
  vpc_id      = "vpc-0e39cff1faa72fc00"

  ingress {
    description      = "HTTPS"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "TF_SG"
  }
}


/* resource "aws_s3_bucket" "bucketsampletest" {
  bucket = var.bucketname 
}

resource "aws_iam_user" "myuser" {
  name = "${var.username}-user"
} */

resource "aws_key_pair" "deployer" {
  key_name   = "tf-key"
  public_key = tls_private_key.rsa.public_key_openssh
}

# RSA key of size 4096 bits
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "tf-key" {
  content = tls_private_key.rsa.private_key_pem
  filename = "tfkey"

}

output "DNS" {
  value = aws_instance.node1.public_dns
}

