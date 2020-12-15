variable "access_key" {}
variable "secret_key" {}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = "ap-south-1"
}

data "aws_ami" "node_app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["packer-example*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["015583679202"]
}

resource "aws_instance" "launch_from_ami" {
  ami           = data.aws_ami.node_app_ami
  instance_type = "t2.micro"

}
