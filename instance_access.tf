/*
module "ACCESS01" {
  source = "./modules/instance_access"
  instance_availability_domain ="xtUA:UK-LONDON-1-AD-1"
  instance_name                ="gmpaccess1"
  private_ip                   ="10.199.1.3"
  fault_domain                 ="FAULT-DOMAIN-1"
  network_sec_groups           =[oci_core_network_security_group.nsg_access.id
                                ,oci_core_network_security_group.nsg_prod_common.id
                                ,oci_core_network_security_group.nsg_nprd_common.id
                                ,oci_core_network_security_group.nsg_v1_vpn.id]
}
module "ACCESS02" {
  source = "./modules/instance_access"
  instance_availability_domain ="xtUA:UK-LONDON-1-AD-2"
  instance_name                ="gmpaccess2"
  private_ip                   ="10.199.1.4"
  fault_domain                 ="FAULT-DOMAIN-1"
  network_sec_groups           =[oci_core_network_security_group.nsg_access.id
                                ,oci_core_network_security_group.nsg_prod_common.id
                                ,oci_core_network_security_group.nsg_nprd_common.id
                                ,oci_core_network_security_group.nsg_v1_vpn.id]
}
module "ACCESS03" {
  source = "./modules/instance_access"
  instance_availability_domain ="xtUA:UK-LONDON-1-AD-3"
  instance_name                ="gmpaccess3"
  private_ip                   ="10.199.1.5"
  fault_domain                 ="FAULT-DOMAIN-1"
  network_sec_groups           =[oci_core_network_security_group.nsg_access.id
                                ,oci_core_network_security_group.nsg_prod_common.id
                                ,oci_core_network_security_group.nsg_nprd_common.id
                                ,oci_core_network_security_group.nsg_v1_vpn.id]
}
*/