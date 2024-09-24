provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "moodle_sg" {
  name        = "moodle_sg"
  description = "Allow HTTP and SSH traffic"
  vpc_id      = "vpc-123456"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
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

resource "aws_instance" "moodle_instance" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.moodle_sg.name]

  tags = {
    Name = "MoodleServer"
  }
}

output "instance_public_ip" {
  value = aws_instance.moodle_instance.public_ip
}
