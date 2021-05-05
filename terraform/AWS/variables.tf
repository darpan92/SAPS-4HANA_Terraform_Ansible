variable "provider_region"{
	type = string
        default = ""
}

variable "instance_name"{
	type = string
        default = ""
}

variable "ami_id"{
	type = string
        default = "ami-0f052119b3c7e61d1"
}

variable "instance_type"{
	type = string
        default = "r4.8xlarge"
}

variable "volume_availability_zone"{
	type = string
        default = ""
}

variable "volume_size"{
	type = string
        default = "1024"
}

variable "volume_name"{
	type = string
        default = ""
}

variable "hosts_filename"{
	type = string
        default = ""
}

variable "key_name"{
	type = string
        default = ""
}
