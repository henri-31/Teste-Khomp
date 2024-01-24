provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "exemplo" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "exemplo" {
  vpc_id     = aws_vpc.exemplo.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_instance" "instancia-khomp" {
  ami           = "ami-#coloque o id da ami"
  instance_type = "t3.medium"
  subnet_id     = aws_subnet.exemplo.id

  tags = {
    Name = "instancia-khomp"
  }
}

resource "aws_security_group" "exemplo" {
  name        = "exemplo-security-group"
  description = "Allow SSH access from specific IP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "exemplo-security-group"
  }
}

resource "aws_s3_bucket" "exemplo" {
  bucket = "avaliacao-khomp-bucket"

  tags = {
    Name        = "bucket-khomp"
    Environment = "Dev"
  }
}