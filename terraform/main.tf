# secure-my-stack Terraform: Minimal Secure AWS Infras

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main"
  }
}

resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow HTTP and SSH traffic"
  vpc_id      = aws_vpc.main.id

ingress = {
    description = "SSH traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

  ingress {
    description = "HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0c2b8ca1dad447f8a"  # Amazon Linux 2
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "secure-web-instance"
  }
}

resource "aws_s3_bucket" "secure_bucket" {
  bucket = "secure-my-stack-bucket-${random_id.bucket_id.hex}"
  force_destroy = true

  tags = {
    Name = "secure-s3-bucket"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "sse" {
  bucket = aws_s3_bucket.secure_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "random_id" "bucket_id" {
  byte_length = 4
}
