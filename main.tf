provider "aws" {
    region = "us-east-2"  
}

data "aws_ec2_instance_types" "free_tier" {
  filter {
    name   = "free-tier-eligible"
    values = ["true"]
  }
}

resource "aws_instance" "app_server" {
  ami           = "ami-00e428798e77d38d9"
  instance_type = data.aws_ec2_instance_types.free_tier.instance_types[0]
  tags = {
      Name = "TF-Instance"
  }
}

