############################################################################
# DNS:
############################################################################
# Custom DHCP Options - Amryt DNS:
/*
resource "oci_core_dhcp_options" "dhcp_options_gmp_dns" {
    compartment_id = module.iam.compartments["common_services"]
    options {
        type               = "DomainNameServer"
        server_type        = "CustomDnsServer"
        custom_dns_servers = [local.ips.gmp_dns["gmp_node1_datacentre01"]
                             ,local.ips.gmp_dns["gmp_node1_datacentre02"]
                             ,local.ips.gmp_dns["vcn_resolver"]]
    }
    options {
        type                = "SearchDomain"
        search_domain_names = [ local.gmp_domain ]
    }
    vcn_id       = module.vcn.vcns["gmp_vcn"]
    display_name = "GMP DNS DHCP Options"
}

output "gmp_dhcp_options" {
    value = oci_core_dhcp_options.dhcp_options_gmp_dns.id
}

############################################################################
*/