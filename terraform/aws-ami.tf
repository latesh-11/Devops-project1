data "aws_ami" "ubuntu" {
  most_recent      = true
  owners           = ["099720109477"] # we can get this by searching any ubuntu ami_id

  filter {
    name   = "name"
    values = [var.AMI_Name] # we can get this by searching any ubuntu ami_id
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

