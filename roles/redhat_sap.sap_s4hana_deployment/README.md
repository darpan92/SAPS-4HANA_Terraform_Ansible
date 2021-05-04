# sap-s4hana-deployment [![Build Status](https://travis-ci.com/redhat-sap/sap-s4hana-deployment.svg?branch=master)](https://travis-ci.com/redhat-sap/sap-s4hana-deployment)

This role installs SAP S/4 HANA on a RHEL 7.x or 8.x system

## Requirements

This role is intended to use on a RHEL system that gets SAP software.
So your system needs to be installed with at least the RHEL core packages, properly registered and prepared for HANA or Netweaver installation.

It needs access to the software repositories required to install SAP HANA (see also: [How to subscribe SAP HANA systems to the Update Services for SAP Solutions](https://access.redhat.com/solutions/3075991))

You can use the [redhat_sap.sap_rhsm](https://galaxy.ansible.com/redhat_sap/sap_rhsm) Galaxy Role to automate this process

To install SAP software on Red Hat Enterprise Linux you need some additional packages which come in a special repository. To get this repository you need to have one
of the following products:

- [RHEL for SAP Solutions](https://access.redhat.com/solutions/3082481) (premium, standard, developer Edition)
- [RHEL for Business Partner NFRs](https://partnercenter.redhat.com/NFRPageLayout)

[Click here](https://developers.redhat.com/products/sap/download/) to achieve a personal developer edition of RHEL for SAP Solutions. Please register as a developer and download the developer edition.

- [Registration Link](http://developers.redhat.com/register) :
  Here you can either register a new personal account or link it to an already existing **personal** Red Hat Network account.
- [Download Link](https://access.redhat.com/downloads/):
  Here you can download the Installation DVD for RHEL with your previously registered account

*NOTE:* This is a regular RHEL installation DVD as RHEL for SAP Solutions is no additional
 product but only a special bundling. The subscription grants you access to the additional
 packages through our content delivery network(CDN) after installation.

It is also important that your disks are setup according to the [SAP storage requirements for SAP HANA](https://www.sap.com/documents/2015/03/74cdb554-5a7c-0010-82c7-eda71af511fa.html). This [BLOG](https://blogs.sap.com/2017/03/07/the-ultimate-guide-to-effective-sizing-of-sap-hana/) is also quite helpful when sizing HANA systems.

## Role Variables

| variable | info | required? |
|:--------:|:----:|:---------:|
|sap_s4hana_deployment_use_password_file|Indicates if the parameter file to deploy S/4 HANA has the passwords hashed in which case the file instkey.pkey must be provided|no, defaulted to `n` value|
|sap_s4hana_deployment_password_file_path|Path to the password file instkey.pkey|no|
|sap_s4hana_deployment_sapcar_path|Target host directory path where SAPCAR tool file is located|yes|
|sap_s4hana_deployment_sapcar_file_name|Name of the SAPCAR tool file|yes|
|sap_s4hana_deployment_swpm_path|Target host directory path where SWPM tool file is located|yes|
|sap_s4hana_deployment_swpm_sar_file_name|Name of the SWPM .SAR file|yes|
|sap_s4hana_deployment_product_id|SAP product reference that will be installed|yes, example `NW_ABAP_OneHost:S4HANA1909.CORE.HDB.ABAP`|
|sap_s4hana_deployment_diagnostics_agent_password|Password for Diagnostics Agent|no|
|sap_s4hana_deployment_ascs_instance_nr|ASCS instance number|yes - **note the required double quotes while adding the variable to your inventory so this is interpreted as a string**|
|sap_s4hana_deployment_ascs_instance_hostname|ASCS instance hostname|yes|
|sap_s4hana_deployment_pas_instance_nr|PAS instance number|no|
|sap_s4hana_deployment_pas_instance_hostname|PAS instance hostname|no|
|sap_s4hana_deployment_ddic_000_password|Password for SAP DDIC user in client 000|no|
|sap_s4hana_deployment_ddic_001_password|Password for SAP DDIC user in client 001|no|
|sap_s4hana_deployment_master_password|Password for users sapadm, \<sid>adm and SAP DDIC in clients 000 and 001|yes|
|sap_s4hana_deployment_db_schema_abap|ABAP schema name in HANA|no, defaulted to `SAPHANADB`|
|sap_s4hana_deployment_db_schema_abap_password|Password for ABAP schema in HANA|yes|
|sap_s4hana_deployment_db_schema_java|JAVA schema name in HANA|no, defaulted to `SAPHANADB`|
|sap_s4hana_deployment_db_schema_java_password|Password for JAVA schema in HANA|yes|
|sap_s4hana_deployment_sid|SID of the S/4 HANA system|yes|
|sap_s4hana_deployment_db_host|Host where the HANA DB runs|yes|
|sap_s4hana_deployment_db_sid|SID of the HANA DB|yes|
|sap_s4hana_deployment_hana_instance_nr|Number of the HANA DB instance|yes - **note the required double quotes while adding the variable to your inventory so this is interpreted as a string**|
|sap_s4hana_deployment_hana_systemdb_password|Password for HANA SYSTEM user for SystemDB in a multi tenant HANA|yes, if HANA 2.0 is being used|
|sap_s4hana_deployment_hana_system_password|Password for HANA SYSTEM user for the whole HANA|yes|
|sap_s4hana_deployment_parallel_jobs_nr|Number of parallel jobs to run the import of the S/4 HANA software into the HAN DB|yes|
|sap_s4hana_deployment_db_sidadm_password|Password of the \<sid>adm user in the HANA server|yes|
|sap_s4hana_deployment_igs_path|Path to the IGS file|yes|
|sap_s4hana_deployment_igs_file_name|Name of the IGS file|yes|
|sap_s4hana_deployment_igs_helper_path|Path to the IGS Helper file|yes|
|sap_s4hana_deployment_igs_helper_file_name|Name of the IGS Helper file|yes|
|sap_s4hana_deployment_kernel_dependent_path|Path to the kernel DB dependent file|yes|
|sap_s4hana_deployment_kernel_dependent_file_name|Name of the kernel DB dependent file|yes|
|sap_s4hana_deployment_kernel_independent_path|Path to the kernel DB independent file|yes|
|sap_s4hana_deployment_kernel_independent_file_name|Name of the kernel DB independent file|yes|
|sap_s4hana_deployment_fqdn|FQDN of the server (short name if FQDN is not configured)|yes|
|sap_s4hana_deployment_set_fqdn|Specifies if FQDN will be used|no, defaulted to `true` - **note the required double quotes while adding the variable to your inventory so this is interpreted as a string**|
|sap_s4hana_deployment_software_path|Path to the S4/HANA software exports|yes|
|sap_s4hana_deployment_sapadm_password|Password for sapadm of SAP Host Agent|no, only if we want to override sap_s4hana_deployment_master_password|
|sap_s4hana_deployment_sap_sidadm_password|Password for \<sid>adm|no, only if we want to override sap_s4hana_deployment_master_password|

## Dependencies

Before using this role ensure your system has been configured properly to run SAP applications and HANA.

You can use the supported roles `sap-preconfigure` and `sap-netweaver-preconfigure` comming with RHEL 7 and 8 with RHEL for SAP Solutions Subscription

The upstream version of these role can be found [here](https://github.com/linux-system-roles/sap-preconfigure) and [here](https://github.com/linux-system-roles/sap-netweaver-preconfigure)

## Example Playbook

```yaml
    - hosts: servers
      roles:
      - role: sap-s4hana-deployment
```

## Example Inventory

```yaml
sap_s4hana_deployment_swpm_path: /usr/local/src
sap_s4hana_deployment_swpm_sar_file_name: SWPM20SP04_6-80003424.SAR
sap_s4hana_deployment_sapcar_path: /usr/local/src
sap_s4hana_deployment_sapcar_file_name: SAPCAR_1311-80000935.EXE
sap_s4hana_deployment_product_id: S4HANA1909.CORE.HDB.ABAP
sap_s4hana_deployment_master_password: "mysecretpassword"
sap_s4hana_deployment_hana_systemdb_password: "mysecretpassword"
sap_s4hana_deployment_db_schema_abap: "SAPHANADB"
sap_s4hana_deployment_db_schema_abap_password: "mysecretpassword"
sap_s4hana_deployment_db_schema_java: "SAPHANADB"
sap_s4hana_deployment_db_schema_java_password: "mysecretpassword"
sap_s4hana_deployment_sid: RHS
sap_s4hana_deployment_ascs_instance_nr: "00"
sap_s4hana_deployment_ascs_instance_hostname: "myhostname"
sap_s4hana_deployment_db_host: "rhel-hana-host"
sap_s4hana_deployment_db_sid: "RHE"
sap_s4hana_deployment_hana_instance_nr: "00"
sap_s4hana_deployment_hana_system_password: "mysecretpassword"
sap_s4hana_deployment_parallel_jobs_nr: 30
sap_s4hana_deployment_db_sidadm_password: "mysecretpassword"
sap_s4hana_deployment_igs_path: /usr/local/src
sap_s4hana_deployment_igs_file_name: igsexe_9-80003187.sar
sap_s4hana_deployment_igs_helper_path: /usr/local/src
sap_s4hana_deployment_igs_helper_file_name: igshelper_17-10010245.sar
sap_s4hana_deployment_kernel_dependent_path: /usr/local/src
sap_s4hana_deployment_kernel_dependent_file_name: SAPEXEDB_27-80004392.SAR
sap_s4hana_deployment_kernel_independent_path: /usr/local/src
sap_s4hana_deployment_kernel_independent_file_name: SAPEXE_27-80004393.SAR
sap_s4hana_deployment_software_path: /usr/local/src
sap_s4hana_deployment_fqdn: "rhel-01"
```

## License

GPLv3

## Author Information

Red Hat SAP Community of Practice
