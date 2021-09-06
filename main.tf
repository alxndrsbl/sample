provider "aws" {
    region = "us-east-2"
}

#AWS Instance
resource "aws_instance" "example" {
    ami = "ami-0ba62214afa52bec7"
    instance_type = "t2.micro"
    availability_zone = "us-east-2a"
  
  lifecycle {
    ignore_changes = [ami]
  }
}

#Key Pair
resource "aws_key_pair" "example" {
  key_name   = "sample-rhel"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCizUtHiCIQj8waqqgp5Rbn5f7DWl6QlSBqI+81X46+Mtbjf+YRQ/+2bJgaqpEfU+OVh/tXIoQQ08J2hzDj6jjSPLj6tpjWpBBfdTVLEC/trORiZEVPBqRT9t2VL0/oNtyJ52PEvmrwHc4TJWhiQraQJhTNVmbiylJzcaSL6Kq8+thkQRfM2e9xXZS+0TvG0TDwB6jpytDgDosSC5tafSmky8AFS9XYTKYJfK95aWEtk3Y5kMuiR1EcIBsPQkWNRUXQQVS2L6ZEPon84RF3ahSVCxFpg1ZSwSfhPdjjF0tl5U6/qxoQcapjDZAX5NOiM+FXfJxn2t+zolZCfxup5jV3 imported-openssh-key"
}
