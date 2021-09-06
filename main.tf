provider "aws" {
    region = "us-east-2"
}

#AWS Instance
resource "aws_instance" "example" {
    ami = "ami-0ba62214afa52bec7"
    instance_type = "t2.micro"
    availability_zone = "us-east-2a"
    key_name = "sample-rhel" 
 
  lifecycle {
    ignore_changes = [ami]
  }
}
