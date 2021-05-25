variable "username"{
	type = string
	default = ""
}

variable "password"{
	type = string
	default = ""
}

variable "tenant_name"{
	type = string
	default = ""
}

variable "tenant_id"{
	type = string
	default = ""
}

variable "domain_name"{
	type = string
	default = ""
}

variable "auth_url"{
	type = string
	default = ""
}

variable "keypair"{
	type = string
	default = ""
}

variable "region"{
	type = string
	default = ""
}

variable "server_name"{
	type = string
	default = ""
}

variable "image_name"{
	type = string
	default = ""
}

variable "flavor_name"{
	type = string
	default = ""
}

variable "network_uuid"{
	type = string
	default = ""
}

variable "network_name"{
	type = string
	default = ""
}

variable "volume_name"{
	type = string
	default = ""
}

variable "volume_size"{
	type = number
	default = ""
}

variable "floatingip_pool"{
	type = string
	default = ""
}

variable "floatingip_subnet_id"{
	type = string
	default = ""
}

variable "hosts_filename"{
	type = string
	default = ""
}

variable "installation_type"{
	type = string
        default = ""
}
