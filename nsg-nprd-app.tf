###########################################################################
# NSG - NonProd Application:
###########################################################################

resource "oci_core_network_security_group" "nsg_nprd_app" {
    compartment_id = module.iam.compartments["common_services"]
    vcn_id         = module.vcn.vcns["gmp_vcn"]
    display_name   = "nsg_nprd_app"
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
 
output "nsg_nprd_app_id" {
    value = oci_core_network_security_group.nsg_nprd_app.id
}

###########################################################################
# INGRESS:
###########################################################################



###########################################################################
# EGRESS:
###########################################################################


###########################################################################
