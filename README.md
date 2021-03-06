# Automate the Deployment of SAP S/4HANA to a SUSE linux based enviornment
The goal of the project is to automate the deployment of SAP S/4HANA 2020 on a SUSE Enviornment. This is a greenfield approach and can easily adapted to any enviornment regardless of if it is a hyperscaler or on-premise landscape. 

### Configuration
In order to run the program, you will need to fill out two parameters files. One for Terraform and one for Ansible. 

Below is an example file for Ansible. This file is located in /vars/ansible_var.yml within this project. 

```json
{
	"private_key": "/etc/ansible/dpid_rsa",
        "hana_media": "/sapmnt/HANA_INSTALL",
        "s4_media": "/sapmnt/s42020",
        "terraform_dir": "/etc/ansible/terraform/OpenStack/dev",
        "sap_hana_deployment_bundle_path": "/media/HANA_INSTALL",
        "sap_hana_deployment_bundle_sar_file_name": "IMDB_SERVER20_051_0-80002031.SAR",
        "sap_hana_deployment_sapcar_path": "/media/HANA_INSTALL",
        "sap_hana_deployment_sapcar_file_name": "SAPCAR",
        "sap_hana_deployment_root_password": "Welcome1",
        "sap_hana_deployment_sapadm_password": "Welcome1",
        "sap_hana_deployment_hana_sid": "HDB",
        "sap_hana_deployment_hana_instance_number": "00",
        "sap_hana_deployment_hana_env_type": "development",
        "sap_hana_deployment_hana_mem_restrict": "n",
        "sap_hana_deployment_common_master_password": "Welcome1",
        "sap_hana_deployment_sidadm_password": "Welcome1",
        "sap_hana_deployment_hana_db_system_password": "Welcome1",
        "sap_hana_deployment_ase_user_password": "Welcome1",
        "sap_hana_deployment_apply_license": false,
        "sap_s4hana_deployment_product_id": "NW_ABAP_OneHost:S4HANA2020.CORE.HDB.ABAP",
        "sap_s4hana_deployment_sapcar_path": "/media/s42020/",
        "sap_s4hana_deployment_sapcar_file_name": "SAPCAR",
        "sap_s4hana_deployment_swpm_path": "/media/s42020/",
        "sap_s4hana_deployment_swpm_sar_file_name": "SWPM20SP07_5-80003424.SAR",
        "sap_s4hana_deployment_db_schema_password": "Welcome1",
        "sap_s4hana_deployment_db_schema_abap_password": "Welcome1",
        "sap_s4hana_deployment_master_password": "Welcome123",
        "sap_s4hana_deployment_hana_systemdb_password": "Welcome1",
        "sap_s4hana_deployment_db_host": "{{ inventory_hostname }}",
        "sap_s4hana_deployment_hana_instance_nr": "00",
        "sap_s4hana_deployment_hana_system_password": "Welcome1",
        "sap_s4hana_deployment_parallel_jobs_nr": "30",
        "sap_s4hana_deployment_db_sidadm_password": "Welcome1",
        "sap_s4hana_deployment_igs_path": "/media/s42020/",
        "sap_s4hana_deployment_igs_file_name": "igsexe_0-70005417.sar",
        "sap_s4hana_deployment_igs_helper_path": "/media/s42020/",
        "sap_s4hana_deployment_igs_helper_file_name": "igshelper_17-10010245.sar",
        "sap_s4hana_deployment_kernel_dependent_path": "/media/s42020/",
        "sap_s4hana_deployment_kernel_dependent_file_name": "SAPEXEDB_19-70005282.SAR",
        "sap_s4hana_deployment_kernel_independent_path": "/media/s42020/",
        "sap_s4hana_deployment_kernel_independent_file_name": "SAPEXE_19-70005283.SAR",
        "sap_s4hana_deployment_software_path": "/media/s42020/",
        "sap_s4hana_deployment_sapadm_password": "Welcome1",
        "sap_s4hana_deployment_sap_sidadm_password": "Welcome1",
        "sap_s4hana_deployment_sid": "S4D",
        "sap_s4hana_deployment_db_sid": "HDB",
        "sidadm": "s4dadm"
}

```
The terraform file can be located under /terraform/AWS/variables.tf. Below is an example of what a filled one would look like. 


variable "provider_region"{
	type = string
        default = "us-east-2"
}

variable "instance_name"{
	type = string
        default = "Test"
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
        default = "us-east-2"
}

variable "volume_size"{
	type = string
        default = "1024"
}

variable "volume_name"{
	type = string
        default = "Test"
}

variable "hosts_filename"{
	type = string
        default = "/etc/ansible/test"
}

variable "key_name"{
	type = string
        default = "Test"
}





