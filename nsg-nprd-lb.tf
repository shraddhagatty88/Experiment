###########################################################################
# NSG - NonProd Load Balancer:
###########################################################################

resource "oci_core_network_security_group" "nsg_nprd_lb" {
    compartment_id = module.iam.compartments["common_services"]
    vcn_id         = module.vcn.vcns["gmp_vcn"]
    display_name   = "nsg_nprd_lb"
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
 
output "nsg_nprd_lb_id" {
    value = oci_core_network_security_group.nsg_nprd_lb.id
}

###########################################################################
# INGRESS:
###########################################################################

resource "oci_core_network_security_group_security_rule" "nsg_nprd_lb_ingress_https_gmp" {
    for_each                  = local.ips.gmp_domains
    network_security_group_id = oci_core_network_security_group.nsg_nprd_lb.id
    direction                 = "INGRESS"
    protocol                  = "6"
    description               = each.key
    source                    = each.value
    source_type               = "CIDR_BLOCK"
    stateless                 = false
    tcp_options {
        destination_port_range {
            min = "443"
            max = "443"
        }
    }
}

resource "oci_core_network_security_group_security_rule" "nsg_nprd_lb_ingress_http_gmp" {
    for_each                  = local.ips.gmp_domains
    network_security_group_id = oci_core_network_security_group.nsg_nprd_lb.id
    direction                 = "INGRESS"
    protocol                  = "6"
    description               = each.key
    source                    = each.value
    source_type               = "CIDR_BLOCK"
    stateless                 = false
    tcp_options {
        destination_port_range {
            min = "80"
            max = "80"
        }
    }
}

resource "oci_core_network_security_group_security_rule" "nsg_nprd_lb_ingress_https_v1" {
    for_each                  = local.ips.v1_domains
    network_security_group_id = oci_core_network_security_group.nsg_nprd_lb.id
    direction                 = "INGRESS"
    protocol                  = "6"
    description               = each.key
    source                    = each.value
    source_type               = "CIDR_BLOCK"
    stateless                 = false
    tcp_options {
        destination_port_range {
            min = "443"
            max = "443"
        }
    }
}

resource "oci_core_network_security_group_security_rule" "nsg_nprd_lb_ingress_http_v1" {
    for_each                  = local.ips.v1_domains
    network_security_group_id = oci_core_network_security_group.nsg_nprd_lb.id
    direction                 = "INGRESS"
    protocol                  = "6"
    description               = each.key
    source                    = each.value
    source_type               = "CIDR_BLOCK"
    stateless                 = false
    tcp_options {
        destination_port_range {
            min = "80"
            max = "80"
        }
    }
}

###########################################################################
# EGRESS:
###########################################################################

module "nsg_nprd_lb_egress_all_out" {
    source                 = "./modules/network-sec-rules"
    net_sec_group_id       = oci_core_network_security_group.nsg_nprd_lb.id
    net_sec_rule_desc      = "nsg_prod_lb_egress_all_out"
    net_sec_rule_dest      = "0.0.0.0/0"
    net_sec_rule_dest_type = "CIDR_BLOCK"
    create_egress_all      = true
}

###########################################################################
