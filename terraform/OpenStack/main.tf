# Define required providers
terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.35.0"
    }
  }
}

# Configure the OpenStack Provider
provider "openstack" {
  user_name = var.username
  tenant_name = var.tenant_name
  tenant_id = var.tenant_id
  project_domain_name = var.domain_name
  user_domain_name = var.domain_name
  password = var.password
  auth_url = var.auth_url
  region = var.region
}

module "webserver" {
  source = "../../../../ansible/modules/openstack-s4-server"
  keypair = var.keypair
  region = var.region
  server_name = var.server_name
  image_name = var.image_name
  flavor_name = var.flavor_name
  network_uuid = var.network_uuid
  network_name = var.network_name
  volume_name = var.volume_name
  volume_size = var.volume_size
  floatingip_pool = var.floatingip_pool
  floatingip_subnet_id = var.floatingip_subnet_id
  hosts_filename = var.hosts_filename
  installation_type = var.installation_type
}
