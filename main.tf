provider "aws" {
  region = "us-east-2"

#AWS Instance
resource "aws_instance" "example" {
    ami = ami-0ba62214afa52bec7
    instance_type = "t2.micro"
    availability_zone = "us-east-2a"
  
  lifecycle {
    ignore_changes = [ami]
  }
}

#AMI Filter for Windows Server 2019 Base
data "aws_ami" "rhel" {
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL-8.4.0_HVM-20210504-x86_64-2-Hourly2-GP2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["981919213787"] # Canonical
}

#EBS Volume and Attachment

resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-2a"
  size              = 10
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.example.id
}
