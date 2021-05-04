# Define required providers
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.32.0"
    }
  }
}


resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name

  tags = {
    Name = var.instance_name
  }
}

resource "aws_ebs_volume" "Test" {
  availability_zone = var.volume_availability_zone
  size              = var.volume_size

  tags = {
    Name = var.volume_name
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.Test.id
  instance_id = aws_instance.web.id
}

resource "local_file" "hosts"{
	content = "[sapservers:children]\nhana\nnetweaver\n\n[hana]\n${aws_instance.web.public_ip}\n\n[netweaver]\n${aws_instance.web.public_ip}"
	filename = var.hosts_filename
}

data "local_file" "template"{
	filename = "/etc/ansible/vars/ansible_vars.yml"
}

resource "local_file" "hosts_vars"{
	content = "${data.local_file.template.content}"
	filename = "/etc/ansible/host_vars/${aws_instance.web.public_ip}.yml"
}