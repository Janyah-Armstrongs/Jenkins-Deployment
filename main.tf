provider "aws" {
    region = "us-east-1"
}

resource "aws_security_group" "JenkinsSG2" {
    name    = "JenkinsSG2"
    vpc_id  = "vpc-0a4032d015d2cef32" 
    
    ingress {
        form_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ['216.126.34.217/32']
        
    }
    
    ingress {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_block  =["0.0.0.0/0"]
        
    }
    
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ['0.0.0.0/0']
        
    }
}
 
resource "aws_instance" "JenkinsServer2024" {
    ami           = "ami-03972092c42e8c0ca"
    instance_type = "t2micro"
    key_name      = "JenkinsKP"
    
    vpc_security_group_ids = [aws_security_group.JenkinsSG2.id]
    
    user_data = <<EOF
      #!/bin/bash
      sudo yum update -y
      sudo amazon-linux-extras install java-openjdk11 -y
      sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
      sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
      sudo yum install jenkins -y
      sudo systemctl start jenkins
      sudo systemctl enable jenkins
      EOF
      
      tags = {
          Name = "JenkinsServer"
      }
}

resource "aws_s3_bucket" "Jenkins08012024" {
    bucket = "Jenkins08012024"
    acl    = "private"
}