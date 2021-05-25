variable "keypair"{
	type = string
}

variable "region"{
	type = string
}

variable "server_name"{
	type = string
}

variable "image_name"{
	type = string
}

variable "flavor_name"{
	type = string
}

variable "network_uuid"{
	type = string
}

variable "network_name"{
	type = string
}

variable "volume_name"{
	type = string
}

variable "volume_size"{
	type = number
}

variable "floatingip_pool"{
	type = string
}

variable "floatingip_subnet_id"{
	type = string
}

variable "hosts_filename"{
	type = string
}

variable "installation_type"{
	type = string
}
