###########################################################################
# NSG - NonProd Database:
###########################################################################

resource "oci_core_network_security_group" "nsg_nprd_db" {
    compartment_id = module.iam.compartments["common_services"]
    vcn_id         = module.vcn.vcns["gmp_vcn"]
    display_name   = "nsg_nprd_db"
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
 
output "nsg_nprd_db_id" {
    value = oci_core_network_security_group.nsg_nprd_db.id
}

###########################################################################
# INGRESS:
###########################################################################

module "nsg_nprd_db_ingress_sql_nprd_app" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = oci_core_network_security_group.nsg_nprd_db.id
    net_sec_rule_desc        = "nsg_nprd_db_ingress_sql_nprd_app"
    net_sec_rule_source      = oci_core_network_security_group.nsg_nprd_app.id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "1521"
    net_sec_rule_tcp_max     = "1521"
}

###########################################################################
# EGRESS:
###########################################################################


###########################################################################
