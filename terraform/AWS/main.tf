# Define required providers
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.32.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.provider_region

}

module "webserver" {
  source = "../../../../ansible/modules/aws-s4-server"
  provider_region = var.provider_region
  instance_name = var.instance_name
  ami_id = var.ami_id
  instance_type = var.instance_type
  volume_availability_zone = var.volume_availability_zone
  volume_size = var.volume_size
  volume_name = var.volume_name
  hosts_filename = var.hosts_filename
  key_name = var.key_name
  installation_type = var.installation_type
}
