############################################################################
# NSG - nprd Common:
############################################################################
# NSG:

resource "oci_core_network_security_group" "nsg_nprd_common" {
    compartment_id = module.iam.compartments["common_services"]
    vcn_id         = module.vcn.vcns["gmp_vcn"]
    display_name   = "nsg_nprd_common"
    defined_tags   = local.tags
    lifecycle {
        ignore_changes = [
            defined_tags["Oracle-Tags.CreatedBy"],
            defined_tags["Oracle-Tags.CreatedOn"],
            defined_tags["Account.Created_By"],
            defined_tags["Account.Created_At"],
        ]
    }
}
 
output "nsg_nprd_common_id" {
    value = oci_core_network_security_group.nsg_nprd_common.id
}

############################################################################
# Ingress:

module "nsg_nprd_common_ingress_ssh_nsg_access" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_desc        = "nsg_nprd_common_ingress_ssh_nsg_access"
    net_sec_rule_source      = oci_core_network_security_group.nsg_access.id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "22"
    net_sec_rule_tcp_max     = "22"
}

module "nsg_nprd_common_ingress_ssh" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_desc        = "nsg_nprd_common_ingress_ssh"
    net_sec_rule_source      = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "22"
    net_sec_rule_tcp_max     = "22"
}

module "nsg_nprd_common_ingress_nfs_tcp1" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_desc        = "nsg_nprd_common_ingress_nfs_tcp1"
    net_sec_rule_source      = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "111"
    net_sec_rule_tcp_max     = "111"
}

module "nsg_nprd_common_ingress_nfs_tcp2" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_desc        = "nsg_nprd_common_ingress_nfs_tcp2"
    net_sec_rule_source      = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "2048"
    net_sec_rule_tcp_max     = "2050"
}

module "nsg_nprd_common_ingress_nfs_udp1" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_desc        = "nsg_nprd_common_ingress_nfs_udp1"
    net_sec_rule_source      = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_udp       = true
    net_sec_rule_udp_min     = "111"
    net_sec_rule_udp_max     = "111"
}

module "nsg_nprd_common_ingress_nfs_udp2" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_desc        = "nsg_nprd_common_ingress_nfs_udp2"
    net_sec_rule_source      = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_udp       = true
    net_sec_rule_udp_min     = "2048"
    net_sec_rule_udp_max     = "2048"
}

module "nsg_nprd_common_ingress_smb_tcp1" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_desc        = "nsg_nprd_common_ingress_smb_tcp1"
    net_sec_rule_source      = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "135"
    net_sec_rule_tcp_max     = "139"
}

module "nsg_nprd_common_ingress_smb_tcp2" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_desc        = "nsg_nprd_common_ingress_smb_tcp2"
    net_sec_rule_source      = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "445"
    net_sec_rule_tcp_max     = "445"
}

module "nsg_nprd_common_ingress_smb_udp1" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_desc        = "nsg_nprd_common_ingress_smb_udp1"
    net_sec_rule_source      = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_udp       = true
    net_sec_rule_udp_min     = "135"
    net_sec_rule_udp_max     = "139"
}

module "nsg_nprd_common_ingress_smb_udp2" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_desc        = "nsg_nprd_common_ingress_smb_udp2"
    net_sec_rule_source      = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_udp       = true
    net_sec_rule_udp_min     = "445"
    net_sec_rule_udp_max     = "445"
}

module "nsg_nprd_common_ingress_http1" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_desc        = "nsg_nprd_common_ingress_http1"
    net_sec_rule_source      = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "8000"
    net_sec_rule_tcp_max     = "8099"
}

module "nsg_nprd_common_ingress_http2" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_desc        = "nsg_nprd_common_ingress_http2"
    net_sec_rule_source      = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "7000"
    net_sec_rule_tcp_max     = "7005"
}

module "nsg_nprd_common_ingress_http3" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_desc        = "nsg_nprd_common_ingress_http3"
    net_sec_rule_source      = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "9001"
    net_sec_rule_tcp_max     = "9001"
}

module "nsg_nprd_common_ingress_https" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_desc        = "nsg_nprd_common_ingress_https"
    net_sec_rule_source      = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "443"
    net_sec_rule_tcp_max     = "443"
}

module "nsg_nprd_common_ingress_smtp" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_desc        = "nsg_nprd_common_ingress_smtp"
    net_sec_rule_source      = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "25"
    net_sec_rule_tcp_max     = "25"
}

module "nsg_nprd_common_ingress_sql" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_desc        = "nsg_nprd_common_ingress_sql"
    net_sec_rule_source      = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "1521"
    net_sec_rule_tcp_max     = "1526"
}
module "nsg_nprd_common_ingress_sql_clone" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_desc        = "nsg_nprd_common_ingress_sql_clone"
    net_sec_rule_source      = oci_core_network_security_group.nsg_prod_common.id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "1521"
    net_sec_rule_tcp_max     = "1526"
}
module "nsg_nprd_common_ingress_ssh_nsg_access_clone" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_desc        = "nsg_nprd_common_ingress_ssh_nsg_access_clone"
    net_sec_rule_source      = oci_core_network_security_group.nsg_prod_common.id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "22"
    net_sec_rule_tcp_max     = "22"
}

module "nsg_nprd_common_ingress_ping" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_desc        = "nsg_nprd_common_ingress_ping"
    net_sec_rule_source      = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_icmp            = true
}

module "nsg_nprd_common_ingress_ECC1" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_desc        = "nsg_nprd_common_ingress_ssh_nsg_access_clone"
    net_sec_rule_source      = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "7775"
    net_sec_rule_tcp_max     = "7778"
}
module "nsg_nprd_common_ingress_ECC2" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_desc        = "nsg_nprd_common_ingress_ssh_nsg_access_clone"
    net_sec_rule_source      = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "5901"
    net_sec_rule_tcp_max     = "5902"
}


############################################################################
# Egress:

module "nsg_nprd_common_egress_all_out" {
    source                 = "./modules/network-sec-rules"
    net_sec_group_id       = oci_core_network_security_group.nsg_nprd_common.id
    net_sec_rule_desc      = "nsg_nprd_common_egress_all_out"
    net_sec_rule_dest      = "0.0.0.0/0"
    net_sec_rule_dest_type = "CIDR_BLOCK"
    create_egress_all      = true
}

############################################################################
