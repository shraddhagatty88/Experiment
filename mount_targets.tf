/*
resource "oci_file_storage_mount_target" "GMP_nprd_mount_target" {
  availability_domain = lookup(data.oci_identity_availability_domains.ads.availability_domains[1],"name")
  compartment_id = module.iam.compartments["nprd_services"]
  subnet_id = module.vcn.subnets["gmp_vcn_sub_fss"]
  display_name = "GMP_nprd_mount_target"
  nsg_ids = [oci_core_network_security_group.nsg_nprd_common.id
            ,oci_core_network_security_group.nsg_v1_vpn.id]
}

resource "oci_file_storage_mount_target" "GMP_prod_mount_target" {
  availability_domain = lookup(data.oci_identity_availability_domains.ads.availability_domains[0],"name")
  compartment_id = module.iam.compartments["prod_services"]
  subnet_id = module.vcn.subnets["gmp_vcn_sub_fss"]
  display_name = "GMP_prod_mount_target"
  nsg_ids = [oci_core_network_security_group.nsg_prod_common.id
            ,oci_core_network_security_group.nsg_access.id
            ,oci_core_network_security_group.nsg_v1_vpn.id]
}

resource "oci_file_storage_mount_target" "GMP_dr_mount_target" {
  availability_domain = lookup(data.oci_identity_availability_domains.ads.availability_domains[2],"name")
  compartment_id = module.iam.compartments["prod_services"]
  subnet_id = module.vcn.subnets["gmp_vcn_sub_fss"]
  display_name = "GMP_dr_mount_target"
  nsg_ids = [oci_core_network_security_group.nsg_prod_common.id
            ,oci_core_network_security_group.nsg_access.id
            ,oci_core_network_security_group.nsg_v1_vpn.id]
}

x*/