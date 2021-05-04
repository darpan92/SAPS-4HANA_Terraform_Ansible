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

# Configure the resource
resource "openstack_compute_instance_v2" "my_instance" {
	name = var.server_name
	region = var.region
	image_name = var.image_name
	flavor_name = var.flavor_name
	key_pair = var.keypair
	
		
	network {
		uuid = var.network_uuid
		name = var.network_name
		}
	}

resource "openstack_blockstorage_volume_v2" "volume_1" {
  name = var.volume_name
  size = var.volume_size
}

resource "openstack_compute_volume_attach_v2" "va_1" {
  instance_id = "${openstack_compute_instance_v2.my_instance.id}"
  volume_id   = "${openstack_blockstorage_volume_v2.volume_1.id}"
}  

resource "openstack_networking_floatingip_v2" "myip" {
  pool = var.floatingip_pool
  subnet_id = var.floatingip_subnet_id
}

resource "openstack_compute_floatingip_associate_v2" "myip" {
  floating_ip = "${openstack_networking_floatingip_v2.myip.address}"
  instance_id = "${openstack_compute_instance_v2.my_instance.id}"
  #fixed_ip = "${openstack_compute_instance_v2.my_instance.network.1.fixed_ip_v4}"
}    

resource "local_file" "hosts"{
	content = "[sapservers:children]\nhana\nnetweaver\n\n[hana]\n${openstack_networking_floatingip_v2.myip.address}\n\n[netweaver]\n${openstack_networking_floatingip_v2.myip.address}"
	filename = var.hosts_filename
}

data "local_file" "template"{
	filename = "/etc/ansible/vars/ansible_vars.yml"
}

resource "local_file" "hosts_vars"{
	content = "${data.local_file.template.content}"
	filename = "/etc/ansible/host_vars/${openstack_networking_floatingip_v2.myip.address}.yml"
}