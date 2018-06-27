terraform {
  backend "s3" {
    bucket         = "hidensneak-terraform"
    key            = "filename.tfstate"
    dynamodb_table = "terraform-state-lock-dynamo"
    region         = "us-east-1"
    encrypt        = true
  }
}

module "aws-us-east-1" {
  source               = "modules/ec2-deployment"
  default_sg_name      = "test"
  aws_sg_id            = ""
  region_count         = 1
  custom_ami           = ""
  aws_instance_type    = ""
  ec2_default_user     = "ubuntu"
  aws_access_key       = "${var.aws_access_key}"
  aws_secret_key       = "${var.aws_secret_key}"
  aws_region           = "us-east-1"
  aws_new_keypair      = "false"
  aws_keypair_name     = "do_rsa"
  aws_private_key_file = "/Users/mike.hodges/.ssh/do_rsa"
  aws_public_key_file  = "/Users/mike.hodges/.ssh/do_rsa.pub"
  ansible_groups       = []
}

module "aws-us-west-2" {
  source               = "modules/ec2-deployment"
  default_sg_name      = "test"
  aws_sg_id            = ""
  region_count         = 1
  custom_ami           = ""
  aws_instance_type    = ""
  ec2_default_user     = "ubuntu"
  aws_access_key       = "${var.aws_access_key}"
  aws_secret_key       = "${var.aws_secret_key}"
  aws_region           = "us-west-2"
  aws_new_keypair      = "false"
  aws_keypair_name     = "do_rsa.pub"
  aws_private_key_file = "/Users/mike.hodges/.ssh/do_rsa"
  aws_public_key_file  = "/Users/mike.hodges/.ssh/do_rsa.pub"
  ansible_groups       = []
}

module "digital-ocean-AMS2" {
  source           = "modules/droplet-deployment"
  do_token         = "${var.do_token}"
  do_image         = ""
  pvt_key          = "/Users/mike.hodges/.ssh/do_rsa"
  ssh_fingerprint  = "b3:b2:c7:b1:73:9e:28:c6:61:8d:15:e1:0e:61:7e:35"
  do_region        = "AMS2"
  do_size          = ""
  do_count         = 1
  do_default_user  = ""
  do_name          = "tester"
  do_firewall_name = ""
  ansible_groups   = []
}
