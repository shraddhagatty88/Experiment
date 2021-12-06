###########################################################################
# NSG - Prod Application:
###########################################################################

resource "oci_core_network_security_group" "nsg_prod_app" {
    compartment_id = module.iam.compartments["common_services"]
    vcn_id         = module.vcn.vcns["gmp_vcn"]
    display_name   = "nsg_prod_app"
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
 
output "nsg_prod_app_id" {
    value = oci_core_network_security_group.nsg_prod_app.id
}

###########################################################################
# INGRESS:
###########################################################################

module "nsg_prod_app_ingress_http_prod_lb" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = oci_core_network_security_group.nsg_prod_app.id
    net_sec_rule_desc        = "nsg_prod_app_ingress_http_prod_lb"
    net_sec_rule_source      = oci_core_network_security_group.nsg_prod_lb.id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "8001"
    net_sec_rule_tcp_max     = "8001"
}

module "nsg_prod_app_ingress_http2_prod_lb" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = oci_core_network_security_group.nsg_prod_app.id
    net_sec_rule_desc        = "nsg_prod_app_ingress_http2_prod_lb"
    net_sec_rule_source      = oci_core_network_security_group.nsg_prod_lb.id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "8024"
    net_sec_rule_tcp_max     = "8024"
}

module "nsg_prod_app_ingress_http_console" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = oci_core_network_security_group.nsg_prod_app.id
    net_sec_rule_desc        = "nsg_prod_app_ingress_http_prod_lb"
    net_sec_rule_source      = oci_core_network_security_group.nsg_prod_lb.id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "7000"
    net_sec_rule_tcp_max     = "7050"
}

###########################################################################
# EGRESS:
###########################################################################


###########################################################################
